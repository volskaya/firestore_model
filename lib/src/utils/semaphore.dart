import 'dart:async';
import 'dart:collection';

/// Semaphore locking mechanism.
class Semaphore {
  /// Creates [Semaphore].
  Semaphore(this.count) : assert(count > 0);

  final _waitQueue = Queue<Completer<void>>();

  /// Amount of callers simultaneously allowed to lock [Semaphore].
  final int count;

  /// Current number of awaiting clients, that have requested a lock.
  int currentCount = 0;

  /// True when the [currentCount] is above 0.
  bool get locked => currentCount > 0;

  /// Acquires a permit from this semaphore, asyncronously blocking until one is
  /// available.
  Future acquire() {
    final completer = Completer<void>();
    if (currentCount + 1 <= count) {
      currentCount += 1;
      // Prevent the event loop from sleeping, if the lock
      // is available instantly
      completer.complete();
    } else {
      _waitQueue.add(completer);
    }
    return completer.future;
  }

  /// Releases a permit, returning it to the semaphore.
  void release() {
    if (currentCount == 0) {
      throw StateError('Unable to release semaphore');
    }

    currentCount -= 1;
    if (_waitQueue.isNotEmpty) {
      currentCount += 1;
      final firstCompleter = _waitQueue.removeFirst();
      firstCompleter.complete();
    }
  }
}
