// ignore_for_file:invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/firestore_model.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utils/utils.dart';

class ObjectWithNoEquality {}

// ignore: subtype_of_sealed_class
class MockReference extends Mock implements DocumentReference {}

const kDocumentPath = 'toggle/test';

MockReference _getMockReference(String path) {
  final mockReference = MockReference();
  when(() => mockReference.path).thenReturn(path);
  when(() => mockReference.id).thenReturn(path.split('/').last);
  return mockReference;
}

extension on FirestoreModel {
  void applyMockReference(String _path) => applyReference(_getMockReference(_path));
  void applyReference(DocumentReference reference) {
    path = reference.path;
    id = reference.id;
  }
}

void main() {
  group('ReferencedModel', () {
    setUp(() async {
      T testBuilder<T>(FirebaseModelType type, String path) => (Toggle()..applyMockReference(path)) as T;
      FirebaseModel.testBuilder = testBuilder;
      FirebaseModel.emptySubscriptions = true;
      FirebaseModel.emptyData = true;
      ReferencedModel.scheduleTasks = false;
    });

    test('`addRef` caches the new object', () async {
      expect(ReferencedModel.isReferenced(kDocumentPath), isFalse);

      final toggle = Toggle()..applyMockReference(kDocumentPath);
      ReferencedModel.addRef(path: kDocumentPath, object: toggle);

      expect(ReferencedModel.isReferenced(kDocumentPath), isTrue);

      final cachedObject = ReferencedModel.getRef<Toggle>(kDocumentPath); // This increments ref too.
      expect(cachedObject.hashCode, equals(toggle.hashCode));

      toggle.dispose();
      cachedObject?.dispose();
    });

    test('`referenceWithSnapshot` caches a new object', () async {
      expect(ReferencedModel.isReferenced(kDocumentPath), isFalse);

      final toggle = Toggle()..applyMockReference(kDocumentPath);
      final cachedObject = await ReferencedModel.referenceWithSnapshot(toggle.modelType, toggle.path, () => toggle);

      expect(ReferencedModel.isReferenced(kDocumentPath), isTrue);
      expect(cachedObject.hashCode, equals(toggle.hashCode));

      cachedObject.dispose();
    });

    test('`referenceWithSnapshot` returns a previously cached object', () async {
      expect(ReferencedModel.isReferenced(kDocumentPath), isFalse);

      final toggle = Toggle()..applyMockReference(kDocumentPath);
      final anotherToggle = Toggle()..applyMockReference(kDocumentPath);
      final cachedObject = await ReferencedModel.referenceWithSnapshot(toggle.modelType, toggle.path, () => toggle);
      final anotherCachedObject =
          await ReferencedModel.referenceWithSnapshot(toggle.modelType, toggle.path, () => anotherToggle);

      expect(ReferencedModel.isReferenced(kDocumentPath), isTrue);
      expect(cachedObject.hashCode, equals(toggle.hashCode));
      expect(anotherCachedObject.hashCode, equals(toggle.hashCode));

      cachedObject.dispose();
      anotherCachedObject.dispose();
    });

    test('`reference` creates a new object', () async {
      expect(ReferencedModel.isReferenced(kDocumentPath), isFalse);

      final cachedObject = await ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, kDocumentPath);

      expect(ReferencedModel.isReferenced(kDocumentPath), isTrue);
      expect(cachedObject, isNotNull);

      cachedObject.dispose();
    });

    test('`reference` reuses a previously cached object', () async {
      expect(ReferencedModel.isReferenced(kDocumentPath), isFalse);

      final ref = _getMockReference(kDocumentPath);
      final toggle = ReferencedModel.addRef(path: ref.path, object: Toggle()..applyReference(ref));
      final cachedObject = await ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, ref.path);

      expect(ReferencedModel.isReferenced(kDocumentPath), isTrue);
      expect(cachedObject, equals(toggle));

      toggle.dispose();
      cachedObject.dispose();
    });

    test('`reference` subscribes a previously unsubscribed, cached object', () async {
      final cachedObject = await ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, kDocumentPath);

      expect(cachedObject.isSubscribed, isFalse);

      final anotherCachedObject = await ReferencedModel.reference<Toggle>(
        FirebaseModelType.firestore,
        kDocumentPath,
        subscribe: true,
      );

      expect(cachedObject.isSubscribed, isTrue);
      expect(cachedObject.hashCode, equals(anotherCachedObject.hashCode));

      anotherCachedObject.dispose(unsubscribe: true);
      expect(cachedObject.isSubscribed, isFalse);

      cachedObject.dispose();
    });

    test('Multiple calls to `referenceWithSnapshot` return the same object', () async {
      final cachedObjects = await Future.wait<Toggle>(
        List.generate(
          5,
          (_) => ReferencedModel.referenceWithSnapshot<Toggle>(
            FirebaseModelType.firestore,
            kDocumentPath,
            () => Toggle()..applyMockReference(kDocumentPath),
          ),
        ),
      );

      Toggle? previousObject;

      for (final object in cachedObjects) {
        if (previousObject == null) {
          previousObject = object;
        } else {
          expect(previousObject.hashCode, equals(object.hashCode));
          previousObject = object;
        }
      }

      for (final object in cachedObjects) object.dispose();
    });

    test('Multiple calls to `reference` return the same object', () async {
      final cachedObjects = await Future.wait<Toggle>(
        List.generate(5, (_) => ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, kDocumentPath)),
      );

      Toggle? previousObject;

      for (final object in cachedObjects) {
        final skipCompare = previousObject == null;
        previousObject = object;
        if (skipCompare) continue;
        expect(previousObject.hashCode, equals(object.hashCode));
      }

      for (final object in cachedObjects) object.dispose();
    });

    test('Reference cleans up its identifiers, when invalidated', () async {
      expect(ReferencedModel.cache.containsKey(kDocumentPath), isFalse);
      expect(ReferencedModel.references.containsKey(kDocumentPath), isFalse);

      final cachedObjects = await Future.wait<Toggle>(
        List.generate(5, (_) => ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, kDocumentPath)),
      );

      expect(ReferencedModel.cache.containsKey(kDocumentPath), isTrue);
      expect(ReferencedModel.references[kDocumentPath], equals(5));

      for (final object in cachedObjects) object.dispose();

      expect(ReferencedModel.cache.containsKey(kDocumentPath), isFalse);
      expect(ReferencedModel.references.containsKey(kDocumentPath), isFalse);
    });

    test('Reference increments and decrements its counter', () async {
      final beginningCount = ReferencedModel.getReferenceCount(kDocumentPath);
      expect(beginningCount, equals(0));

      final cachedObjects = await Future.wait<Toggle>(
        List.generate(5, (_) => ReferencedModel.reference<Toggle>(FirebaseModelType.firestore, kDocumentPath)),
      );

      final activeCount = ReferencedModel.getReferenceCount(kDocumentPath);
      expect(activeCount, equals(5));

      for (final object in cachedObjects) object.dispose();

      final finalCount = ReferencedModel.getReferenceCount(kDocumentPath);
      expect(finalCount, equals(0));
    });
  });

  // NOTE: The memoizer is not even used anymore and it was moved to the utils package. Move these tests as well.
  group('Memoizer', () {
    late ObjectWithNoEquality flag;

    setUp(() {
      flag = ObjectWithNoEquality();
    });

    test('Multiple calls to the future return the same value', () async {
      final memoizer = Memoizer(future: () => Future.value(flag));
      final values = await Future.wait(List.generate(5, (_) => memoizer.future));

      expect(memoizer.value, equals(flag));
      for (final value in values) expect(value, equals(flag));

      memoizer.invalidate();
    });

    test('Value is resolved', () async {
      final memoizerA = Memoizer(future: () => Future.value(flag));
      final memoizerB = Memoizer(future: () => Future.sync(() => flag));

      expect(memoizerA.value, isNull);
      expect(memoizerB.value, isNull);
      await pumpEventQueue(times: 1);

      expect(memoizerA.value, equals(flag));
      expect(memoizerB.value, equals(flag));

      memoizerA.invalidate();
      memoizerB.invalidate();

      expect(memoizerA.value, isNull);
      expect(memoizerB.value, isNull);
    });

    test('Value is ignored, if invalidated early', () async {
      final memoizer = Memoizer(future: () => Future.delayed(const Duration(milliseconds: 5), () => flag));
      expect(memoizer.value, isNull);

      memoizer.invalidate();
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(memoizer.value, isNull);
    });

    test('Async value is unreferenced, when invalidated', () async {
      final memoizer = Memoizer(future: () => Future.value(flag));
      expect(memoizer.value, isNull);

      await pumpEventQueue(times: 1);
      memoizer.invalidate();
      expect(memoizer.value, isNull);
    });

    test('Completer is completed, when invalidated', () async {
      final memoizer = Memoizer(future: () => Future.value(flag));
      expect(memoizer.isCompleted, isFalse);

      memoizer.invalidate();
      expect(memoizer.isCompleted, isTrue);
    });

    test('Instantiating with a sync value, has a future', () async {
      final memoizer = Memoizer.of(flag);
      expect(memoizer.isCompleted, isTrue);

      final futureValue = await memoizer.future;
      expect(futureValue, equals(flag));
      expect(futureValue, equals(memoizer.value));
    });
  });
}
