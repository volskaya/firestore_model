/// All [FirestoreCollectionBuilder] cargo objects must extend this to
/// allow the collection to call its dispose.
abstract class FirestoreCollectionCargo {
  /// The dispose method of the cargo object.
  void dispose();
}
