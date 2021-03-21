import 'package:delayed_progress_indicator/delayed_progress_indicator.dart';
import 'package:fancy_switcher/fancy_switcher.dart';
import 'package:firestore_model/src/firestore_collection_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Builder callback of [FirestoreCollectionSwitcher].
typedef FirestoreCollectionSwitcherBuilder = Widget Function(BuildContext context, FirestoreCollectionStatus status);

/// Builder widget that observes [FirestoreCollectionBuilderState] and rebuilds children
/// according to the current list status.
///
/// If status != [FirestoreCollectionStatus.ready], children are built in a [SingleChildScrollView]
/// to allow interacting with refresh containers, etc.
class FirestoreCollectionSwitcher extends StatelessObserverWidget {
  /// Creates a vertical [FirestoreCollectionSwitcher].
  const FirestoreCollectionSwitcher.vertical({
    Key? key,
    required this.collection,
    required this.builder,
    this.contentPadding,
    this.fillColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 300),
  })  : _axis = Axis.vertical,
        super(key: key, name: 'firestore_collection_switcher');

  /// Creates a horizontal [FirestoreCollectionSwitcher].
  const FirestoreCollectionSwitcher.horizontal({
    Key? key,
    required this.collection,
    required this.builder,
    this.contentPadding,
    this.fillColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 300),
  })  : _axis = Axis.horizontal,
        super(key: key, name: 'firestore_collection_switcher');

  /// The collection this builder will observe.
  final FirestoreCollectionBuilderState collection;

  /// Builder callback.
  final FirestoreCollectionSwitcherBuilder builder;

  /// Content padding of the [SingleChildScrollView], when status != [FirestoreCollectionStatus.ready].
  final EdgeInsets? contentPadding;

  /// Switcher's background color.
  final Color fillColor;

  /// Switcher's animation duration.
  final Duration duration;

  final Axis _axis;

  @override
  Widget build(BuildContext context) {
    final key = ValueKey(collection.status);
    Widget body = Center(key: key, child: builder(context, collection.status));

    if (contentPadding != null) {
      body = MediaQuery(
        data: MediaQuery.of(context).copyWith(padding: contentPadding),
        child: body,
      );
    }

    if (collection.status != FirestoreCollectionStatus.ready) {
      body = CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(), // Always scroll so this can send events to refresh containers.
        scrollDirection: _axis,
        clipBehavior: Clip.none,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: body,
          ),
        ],
      );
    }

    body = FancySwitcherTag(
      tag: collection.status.index,
      child: SizedBox.expand(child: body),
    );

    switch (_axis) {
      case Axis.horizontal:
        return FancySwitcher.horizontal(
          child: body,
          fillColor: fillColor,
          duration: duration,
        );
      case Axis.vertical:
        return FancySwitcher.vertical(
          child: body,
          fillColor: fillColor,
          duration: duration,
        );
      default:
        throw UnimplementedError();
    }
  }
}

/// [SliverCollectionBuilder] sliver list builder with first item reacting to [SliverCollectionBuilderState.status].
class FirestoreCollectionSliverList extends StatelessObserverWidget {
  /// Creates [FirestoreCollectionSliverList].
  const FirestoreCollectionSliverList({
    Key? key,
    required this.collection,
    required this.childBuilder,
    this.tailBuilder,
  })  : itemExtent = null,
        super(key: key, name: 'firestore_collection_sliver_list');

  /// Creates fixed extent variation of [FirestoreCollectionSliverList].
  const FirestoreCollectionSliverList.fixedExtent({
    Key? key,
    required this.collection,
    required this.childBuilder,
    required this.itemExtent,
    this.tailBuilder,
  }) : super(key: key, name: 'firestore_collection_sliver_list');

  /// The collection this builder will observe.
  final FirestoreCollectionBuilderState collection;

  /// Builder of the list items.
  final IndexedWidgetBuilder childBuilder;

  /// The builder of the lists tail, when the end of [FirestoreCollectionBuilder] is reached.
  final WidgetBuilder? tailBuilder;

  /// Item extent.
  final double? itemExtent;

  SliverChildBuilderDelegate _getDelegate() => SliverChildBuilderDelegate(
        (context, i) => tailBuilder != null && i == collection.paginatedItems.length
            ? tailBuilder!(context)
            : childBuilder(context, i),
        addAutomaticKeepAlives: false,
        childCount: collection.paginatedItems.length + (tailBuilder != null && collection.isEndReached ? 1 : 0),
      );

  @override
  Widget build(BuildContext context) => itemExtent != null
      ? SliverFixedExtentList(key: key, itemExtent: itemExtent!, delegate: _getDelegate())
      : SliverList(key: key, delegate: _getDelegate());
}

/// Default status builder of [FirestoreCollectionnSliverList].
class FirestoreCollectionStatusIndicator extends StatelessWidget {
  /// Creates [FirestoreCollectionStatusIndicator].
  const FirestoreCollectionStatusIndicator({
    Key? key,
    required this.status,
    required this.emptyLabel,
    this.size,
  }) : super(key: key);

  /// The collection status this builder will build off of.
  final FirestoreCollectionStatus status;

  /// Text widget built, when the collection has no items.
  final String emptyLabel;

  /// [Size] of an optional [SizedBox] to wrap the widget with.
  ///
  /// No poin to use this when building inside a fixed extent list.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final horizontalPadding = mediaQuery.padding.copyWith(top: 0, bottom: 0);
    final theme = Theme.of(context);

    Widget child;

    switch (status) {
      case FirestoreCollectionStatus.ready:
      case FirestoreCollectionStatus.idle:
      case FirestoreCollectionStatus.loading:
        child = Padding(
          padding: horizontalPadding,
          child: const DelayedProgressIndicator(),
        );
        break;
      case FirestoreCollectionStatus.empty:
        child = Center(
          child: Padding(
            padding: horizontalPadding,
            child: Text(
              emptyLabel,
              style: theme.textTheme.subtitle2!.apply(color: theme.dividerColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        );
        break;
      default:
        throw UnimplementedError();
    }

    return size != null ? SizedBox.fromSize(size: size, child: child) : child;
  }
}

/// Default tail builder of [FirestoreCollectionnSliverList].
class FirestoreCollectionTailBuilder extends StatelessWidget {
  /// Creates [FirestoreCollectionTailBuilder].
  const FirestoreCollectionTailBuilder({
    Key? key,
    required this.label,
    this.size,
  }) : super(key: key);

  /// Text to display as the tail.
  final String label;

  /// [Size] of an optional [SizedBox] to wrap the widget with.
  ///
  /// No poin to use this when building inside a fixed extent list.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = Center(
      child: Padding(
        padding: MediaQuery.of(context).padding.copyWith(top: 0, bottom: 0),
        child: Text(
          label,
          style: theme.textTheme.subtitle2!.apply(color: theme.dividerColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return size != null ? SizedBox.fromSize(size: size, child: child) : child;
  }
}
