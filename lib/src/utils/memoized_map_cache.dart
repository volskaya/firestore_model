import 'dart:async';
import 'dart:collection';

import 'package:quiver/cache.dart';
import 'package:quiver/collection.dart';

class MemoizedMapCache<K, V> {
  /// Creates a new [MemoizedMapCache], optionally using [map] as the backing [Map].
  MemoizedMapCache({Map<K, V>? map}) : _map = map ?? HashMap<K, V>();

  /// Creates a new [MemoizedMapCache], using [LruMap] as the backing [Map].
  ///
  /// When [maximumSize] is specified, the cache is limited to the specified
  /// number of pairs, otherwise it is limited to 100.
  factory MemoizedMapCache.lru({int? maximumSize}) {
    // TODO(cbracken): inline the default value here for readability.
    // https://github.com/google/quiver-dart/issues/653
    return MemoizedMapCache<K, V>(map: LruMap(maximumSize: maximumSize));
  }

  final Map<K, V> _map;

  /// Map of outstanding ifAbsent calls used to prevent concurrent loads of the
  /// same key.
  final _outstanding = HashMap<K, FutureOr<V>>();
  final _invalidated = HashSet<K>();

  Future<V?> get(K key, {Loader<K, V>? ifAbsent}) async {
    _invalidated.remove(key);

    if (_map.containsKey(key)) {
      return _map[key];
    }
    // If this key is already loading then return the existing future.
    if (_outstanding.containsKey(key)) {
      return _outstanding[key];
    }
    if (ifAbsent != null) {
      final futureOr = ifAbsent(key);
      _outstanding[key] = futureOr;
      V v;
      try {
        v = await futureOr;
      } finally {
        // Always remove key from [_outstanding] to prevent returning the
        // failed result again.
        _outstanding.remove(key);
      }
      if (!_invalidated.contains(key)) _map[key] = v;
      return v;
    }
    return null;
  }

  V? getValue(K key) => _map[key];

  bool hasResolved(K key) => _map.containsKey(key);
  bool containsKey(K key) => _map.containsKey(key) || _outstanding.containsKey(key);

  void set(K key, V value) {
    _invalidated.remove(key);
    _map[key] = value;
  }

  V? invalidate(K key) {
    if (_outstanding.containsKey(key)) _invalidated.add(key);
    return _map.remove(key);
  }
}
