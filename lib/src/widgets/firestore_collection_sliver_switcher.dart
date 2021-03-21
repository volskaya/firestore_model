import 'package:fancy_switcher/fancy_switcher.dart';
import 'package:firestore_model/src/firestore_collection_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Builder widget that observes [FirestoreCollectionBuilderState] and rebuilds children
/// according to the current list status.
///
/// If status != [FirestoreCollectionStatus.ready], children are built in a [SingleChildScrollView]
/// to allow interacting with refresh containers, etc.
class FirestoreCollectionSliverSwitcher extends StatelessObserverWidget {
  /// Creates a vertical [FirestoreCollectionSliverSwitcher].
  const FirestoreCollectionSliverSwitcher.vertical({
    Key? key,
    required this.collection,
    required this.builder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.contentPadding = EdgeInsets.zero,
    this.fillColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 300),
    this.addBuilders = true,
  })  : _axis = Axis.vertical,
        super(key: key);

  /// Creates a horizontal [FirestoreCollectionSliverSwitcher].
  const FirestoreCollectionSliverSwitcher.horizontal({
    Key? key,
    required this.collection,
    required this.builder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.contentPadding = EdgeInsets.zero,
    this.fillColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 300),
    this.addBuilders = true,
  })  : _axis = Axis.horizontal,
        super(key: key);

  /// The collection this builder will observe.
  final FirestoreCollectionBuilderState collection;

  /// Main list body builder.
  final WidgetBuilder builder;

  /// Builder for when the list is empty.
  final WidgetBuilder? emptyBuilder;

  /// Builder for when the list is first loading.
  final WidgetBuilder? loadingBuilder;

  /// Content padding of the [SingleChildScrollView], when status != [FirestoreCollectionStatus.ready].
  final EdgeInsets contentPadding;

  /// Switcher's background color.
  final Color fillColor;

  /// Switcher's animation duration.
  final Duration duration;

  /// Whether to wrap the child builders in [Builder], to give them a new [BuildContext].
  final bool addBuilders;

  final Axis _axis;

  @override
  Widget build(BuildContext context) {
    Widget? body;

    switch (collection.status) {
      case FirestoreCollectionStatus.idle:
      case FirestoreCollectionStatus.loading:
        body = loadingBuilder != null
            ? SliverPadding(
                key: const ValueKey('loading'),
                padding: contentPadding,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: addBuilders ? Builder(builder: loadingBuilder!) : loadingBuilder!(context),
                  ),
                ),
              )
            : null;
        break;
      case FirestoreCollectionStatus.empty:
        body = emptyBuilder != null
            ? SliverPadding(
                key: const ValueKey('empty'),
                padding: contentPadding,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: addBuilders ? Builder(builder: emptyBuilder!) : emptyBuilder!(context),
                  ),
                ),
              )
            : null;
        break;
      case FirestoreCollectionStatus.ready:
        body = KeyedSubtree(
          key: const ValueKey('ready'),
          child: addBuilders ? Builder(builder: builder) : builder(context),
        );
        break;
    }

    switch (_axis) {
      case Axis.horizontal:
        return FancySwitcher.horizontal(
          child: body,
          fillColor: fillColor,
          duration: duration,
          sliver: true,
        );
      case Axis.vertical:
        return FancySwitcher.vertical(
          child: body,
          fillColor: fillColor,
          duration: duration,
          sliver: true,
        );
    }
  }
}
