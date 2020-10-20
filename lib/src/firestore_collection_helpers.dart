import 'dart:math' as math;

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
    Key key,
    @required this.collection,
    @required this.builder,
    this.contentPadding,
  })  : _axis = Axis.vertical,
        super(key: key, name: 'firestore_collection_switcher');

  /// Creates a horizontal [FirestoreCollectionSwitcher].
  const FirestoreCollectionSwitcher.horizontal({
    Key key,
    @required this.collection,
    @required this.builder,
    this.contentPadding,
  })  : _axis = Axis.horizontal,
        super(key: key, name: 'firestore_collection_switcher');

  /// The collection this builder will observe.
  final FirestoreCollectionBuilderState collection;

  /// Builder callback.
  final FirestoreCollectionSwitcherBuilder builder;

  /// Content padding of the [SingleChildScrollView], when status != [FirestoreCollectionStatus.ready].
  final EdgeInsets contentPadding;

  final Axis _axis;

  @override
  Widget build(BuildContext context) {
    final key = ValueKey(collection.status);
    Widget body = KeyedSubtree(key: key, child: builder(context, collection.status));

    if (collection.status != FirestoreCollectionStatus.ready) {
      body = SingleChildScrollView(
        key: ValueKey(collection.status),
        padding: contentPadding ?? MediaQuery.of(context).padding,
        physics: const AlwaysScrollableScrollPhysics(),
        child: body,
        scrollDirection: _axis,
      );
    }

    switch (_axis) {
      case Axis.horizontal:
        return FancySwitcher.horizontal(child: body);
      case Axis.vertical:
        return FancySwitcher.vertical(child: body);
      default:
        throw UnimplementedError();
    }
  }
}

/// [SliverCollectionBuilder] sliver list builder with first item reacting to [SliverCollectionBuilderState.status].
class FirestoreCollectionSliverList extends StatelessObserverWidget {
  /// Creates [FirestoreCollectionSliverList].
  const FirestoreCollectionSliverList({
    Key key,
    @required this.collection,
    @required this.childBuilder,
    @required this.childCount,
    this.statusBuilder,
    this.tailBuilder,
  })  : itemExtent = null,
        super(key: key, name: 'firestore_collection_sliver_list');

  /// Creates fixed extent variation of [FirestoreCollectionSliverList].
  const FirestoreCollectionSliverList.fixedExtent({
    Key key,
    @required this.collection,
    @required this.childBuilder,
    @required this.childCount,
    @required this.itemExtent,
    this.statusBuilder,
    this.tailBuilder,
  }) : super(key: key, name: 'firestore_collection_sliver_list');

  /// The collection this builder will observe.
  final FirestoreCollectionBuilderState collection;

  /// Builder of the list items.
  final IndexedWidgetBuilder childBuilder;

  /// Builder of the status tile, when collection status != [FirestoreCollectionStatus.ready]
  final FirestoreCollectionSwitcherBuilder statusBuilder;

  /// Optional tile to build at the end of the list.
  final WidgetBuilder tailBuilder;

  /// Item count.
  final int childCount;

  /// Item extent.
  final double itemExtent;

  SliverChildBuilderDelegate _getDelegate() => SliverChildBuilderDelegate(
        (context, i) {
          if (statusBuilder != null && i == 0) {
            // Build the first tile.
            switch (collection.status) {
              case FirestoreCollectionStatus.ready:
                break; // Continue to the default builder.
              case FirestoreCollectionStatus.idle:
              case FirestoreCollectionStatus.loading:
              case FirestoreCollectionStatus.empty:
                return statusBuilder(context, collection.status);
              default:
                throw UnimplementedError();
            }
          } else if (tailBuilder != null && collection.status == FirestoreCollectionStatus.ready && i == childCount) {
            // Build the last tile.
            return tailBuilder(context);
          }

          // All the other tiles.
          return childBuilder(context, i);
        },
        addAutomaticKeepAlives: false,
        childCount: math.max(
          collection.status == FirestoreCollectionStatus.ready && tailBuilder != null ? childCount + 1 : childCount,
          1,
        ),
      );

  @override
  Widget build(BuildContext context) => itemExtent != null
      ? SliverFixedExtentList(key: key, itemExtent: itemExtent, delegate: _getDelegate())
      : SliverList(key: key, delegate: _getDelegate());
}

/// Default status builder of [FirestoreCollectionnSliverList].
class FirestoreCollectionStatusIndicator extends StatelessWidget {
  /// Creates [FirestoreCollectionStatusIndicator].
  const FirestoreCollectionStatusIndicator({
    Key key,
    @required this.status,
    @required this.emptyLabel,
  }) : super(key: key);

  /// The collection status this builder will build off of.
  final FirestoreCollectionStatus status;

  /// Text widget built, when the collection has no items.
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    assert(
      status != FirestoreCollectionStatus.ready,
      'This widget is intended for other statuses, except ready',
    );

    switch (status) {
      case FirestoreCollectionStatus.idle:
      case FirestoreCollectionStatus.loading:
        return const DelayedProgressIndicator();
      case FirestoreCollectionStatus.empty:
        return Center(
          child: Text(
            emptyLabel,
            style: theme.textTheme.subtitle2.apply(color: theme.hintColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        );
      default:
        throw UnimplementedError();
    }
  }
}

/// Default tail builder of [FirestoreCollectionnSliverList].
class FirestoreCollectionTailBuilder extends StatelessObserverWidget {
  /// Creates [FirestoreCollectionTailBuilder].
  const FirestoreCollectionTailBuilder({
    Key key,
    @required this.label,
  }) : super(key: key, name: 'firestore_collection_tail_builder');

  /// Text to display as the tail.
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final collection = FirestoreCollectionBuilder.of(context);
    return FancySwitcher(
      child: !collection.isEndReached
          ? const DelayedProgressIndicator()
          : Center(
              child: Text(
                label,
                style: theme.textTheme.subtitle2.apply(color: theme.hintColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
