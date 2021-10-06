class CollectionList<T> {
  CollectionList({
    int initialLength = 0,
  }) : _items = List<T?>.filled(initialLength, null);

  late List<T?> _items;
  int _count = 0;

  bool get isEmpty => _count == 0;
  bool get isNotEmpty => _count > 0;
  int get length => _count;
  T? get(int index) => _items[index];
  T? get lastOrNull => isNotEmpty ? _items[_count - 1] : null;

  T? operator [](int index) => _items[index];

  void addAll(Iterable<T> items) => items.forEach(add);

  void add(T item) {
    if (_count == _items.length) {
      if (_count == 0) {
        _items = List<T?>.filled(1, null);
      } else {
        final List<T?> newItems = List<T?>.filled(_items.length * 2, null);
        for (int i = 0; i < _count; i++) {
          newItems[i] = _items[i];
        }
        _items = newItems;
      }
    }
    _items[_count++] = item;
  }

  void _removeAt(int index) {
    // The list holding the listeners is not growable for performances reasons.
    // We still want to shrink this list if a lot of listeners have been added
    // and then removed outside a notifyListeners iteration.
    // We do this only when the real number of listeners is half the length
    // of our list.
    _count -= 1;
    if (_count * 2 <= _items.length) {
      final List<T?> newItems = List<T?>.filled(_count, null);

      // Listeners before the index are at the same place.
      for (int i = 0; i < index; i++) newItems[i] = _items[i];

      // Listeners after the index move towards the start of the list.
      for (int i = index; i < _count; i++) newItems[i] = _items[i + 1];

      _items = newItems;
    } else {
      // When there are more listeners than half the length of the list, we only
      // shift our listeners, so that we avoid to reallocate memory for the
      // whole list.
      for (int i = index; i < _count; i++) _items[i] = _items[i + 1];
      _items[_count] = null;
    }
  }

  void removeListener(T listener) {
    for (int i = 0; i < _count; i++) {
      final T? _listener = _items[i];
      if (_listener == listener) {
        _removeAt(i);

        // if (_notificationCallStackDepth > 0) {
        //   // We don't resize the list during notifyListeners iterations
        //   // but we set to null, the listeners we want to remove. We will
        //   // effectively resize the list at the end of all notifyListeners
        //   // iterations.
        //   _items[i] = null;
        //   _reentrantlyRemovedListeners++;
        // } else {
        //   // When we are outside the notifyListeners iterations we can
        //   // effectively shrink the list.
        //   _removeAt(i);
        // }
        break;
      }
    }
  }
}
