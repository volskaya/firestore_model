# Firestore model plugin

Provides an abstract class for creating observable Firestore models. This model is best extended with [Mobx.](https://pub.dev/packages/mobx)

Also includes widgets for building these models by their Firestore reference and Firestore collection subscribable list builders.

## Usage

To use this plugin, add `firestore_model` as a [dependency to your pubspec.yaml file.](https://pub.dev/packages/firestore_model/install)

**Note: The package is based on the new Firebase refactor.**

## Examples

All of these code sippets are taken from the [Flutter Firestore](https://github.com/volskaya/firestore_model_example) example app.

###### Observable model

```dart
@JsonSerializable()
class User extends _User with _$User {
  static final collection = FirebaseFirestore.instance.collection('users');

  /// Create [User] from json
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Convert [User] to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

abstract class _User extends FirestorePhotoModel<User> with Store {
  @observable
  @JsonKey()
  String name;
  @observable
  @JsonKey()
  @StringWithLineBreaksConverter()
  String description;
  @observable
  @JsonKey(defaultValue: 0)
  int views = 0;
  @observable
  @JsonKey(defaultValue: 0)
  int followers = 0;

  @override
  void onSnapshot(User x) {
    super.onSnapshot(x);
    name = x.name;
    description = x.description;
    views = x.views;
    followers = x.followers;
  }
}
```

###### Reference builder

```dart
FirestoreReferenceBuilder<Album>(
  bucket: 'overview_preview_$i',
  reference: widget.references[i],
  subscribe: true,
  builder: (_, album) => AnimatedSize(
    vsync: this,
    duration: kFastMotionDuration,
    curve: Curves.fastOutSlowIn,
    child: FancySwitcher(
      child: album == null
          ? const AspectRatio(
              aspectRatio: 1,
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : AlbumTile(
              key: ValueKey(album.id),
              album: album,
              flip: i.isOdd,
              dense: false,
            ),
    ),
  ),
);
```

###### Subscribable collection

```dart
class _AlbumList extends StatelessWidget {
  const _AlbumList({Key key, @required this.user}) : super(key: key);

  final User user;

  Widget _buildSubscribedList(FirestoreCollectionBuilderState<Album> collection) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) {
            final index = collection.subscribedItems.length - (i + 1);
            final item = collection.subscribedItems[index];
            return Padding(
              key: ValueKey(item.id),
              padding: index > 0 ? const EdgeInsets.only(bottom: 24) : EdgeInsets.zero,
              // Subscribe to new items to allow the tile to animate when its photos are processed
              child: FirestoreReferenceBuilder<Album>(
                reference: item.reference,
                bucket: item.reference.path,
                subscribe: true,
                builder: (_, album) => AlbumTile(album: item, flip: index.isOdd, dense: true),
              ),
            );
          },
          childCount: collection.subscribedItems.length,
          addAutomaticKeepAlives: false,
        ),
      );

  Widget _buildPaginatedList(FirestoreCollectionBuilderState<Album> collection) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) {
            final item = collection.paginatedItems[i];
            return Padding(
              key: ValueKey(item.id),
              padding: i < collection.paginatedItems.length ? const EdgeInsets.only(bottom: 24) : EdgeInsets.zero,
              child: Paginator(
                paginator: collection.getPaginator(i),
                child: FadingTile(
                  key: ValueKey(item.id),
                  staggerFrom: collection.pageTime,
                  hitsPerPage: collection.itemsPerPage,
                  staggerIndex: i % collection.itemsPerPage,
                  child: AlbumTile(album: item, flip: i.isOdd, dense: true),
                ),
              ),
            );
          },
          childCount: collection.paginatedItems.length,
          addAutomaticKeepAlives: false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FirestoreCollectionBuilder<Album>(
      bucket: 'photo_list_${user.reference.path}',
      collection: Album.collection.where('owner', isEqualTo: user.id),
      subscribe: true,
      builder: (_, collection) => CustomScrollView(
        slivers: [
          const SliverSafeArea(
            minimum: EdgeInsets.only(top: 24),
            top: false,
            sliver: SliverPadding(padding: EdgeInsets.zero),
          ),
          if (collection.subscribedItems.isNotEmpty) _buildSubscribedList(collection),
          if (collection.subscribedItems.isNotEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListDivider(text: Text('NEW ↑')),
              ),
            ),
          if (collection.paginatedItems.isNotEmpty) _buildPaginatedList(collection),
          const SliverSafeArea(minimum: EdgeInsets.only(bottom: 24), sliver: SliverPadding(padding: EdgeInsets.zero)),
        ],
      ),
    );
  }
}
```

###### Firestore toggle

```dart
FirestoreToggle(
  toggle: user.reference.collection('followers'),
  id: AuthStore.instance.user?.uid,
  enabled: AuthStore.instance.authenticated && AuthStore.instance.user?.uid != user.id && user.exists == true,
  countToggle: true,
  builder: (context, ready, toggled, handler) => FancySwitcher(
    child: toggled
        ? IconButton(
            tooltip: 'Unfollow ${Format.userName(user)}',
            key: const ValueKey(true),
            onPressed: ready ? handler : null,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            icon: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: const Icon(MdiIcons.accountRemoveOutline),
              decoration: ShapeDecoration(
                color: theme.colorScheme.secondary,
                shape: const CircleBorder(),
              ),
            ),
          )
        : IconButton(
            alignment: Alignment.center,
            tooltip: 'Follow ${Format.userName(user)}',
            key: const ValueKey(false),
            onPressed: ready ? handler : null,
            icon: const Icon(MdiIcons.accountPlus),
          ),
    ),
);
```
