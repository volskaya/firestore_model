// ignore_for_file:unnecessary_parenthesis

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/src/firebase_model.dart';
import 'package:firestore_model/src/models/toggle.dart';
import 'package:firestore_model/src/referenced_model.dart';
import 'package:firestore_model/src/utils/future_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReference extends Mock implements DocumentReference {}

const kDocumentPath = 'toggle/test';

MockReference _getMockReference(String path) {
  final mockReference = MockReference();
  when(() => mockReference.path).thenReturn(path);
  when(() => mockReference.id).thenReturn(path.split('/').last);
  return mockReference;
}

void main() {
  setUp(() {
    T testBuilder<T>(FirebaseModelType type, String path) => (Toggle()..reference = _getMockReference(path)) as T;
    FirebaseModel.testBuilder = testBuilder;
  });

  test('Asynchronous FutureItem instantiates with no item', () {
    final futureToggle = FutureItem<Toggle>(path: kDocumentPath, type: FirebaseModelType.firestore);

    expect(futureToggle.item, isNull);
    expect(futureToggle.synchronous, isFalse);

    futureToggle.dispose();
  });

  test('Asynchronous FutureItem has an item after fetch completes', () async {
    final futureToggle = FutureItem<Toggle>(path: kDocumentPath, type: FirebaseModelType.firestore);

    expect(futureToggle.item, isNull);
    expect(futureToggle.synchronous, isFalse);
    expect(futureToggle.path, equals(kDocumentPath));

    await futureToggle.future;
    expect(futureToggle.item, isNotNull);
    expect(futureToggle.item, isNotNull);
    expect(futureToggle.item?.path, equals(kDocumentPath));

    futureToggle.dispose();
  });

  test('Synchronous FutureItem has the item available immediately', () async {
    final toggle = Toggle()..reference = _getMockReference(kDocumentPath);
    final futureToggle = FutureItem<Toggle>.of(item: toggle, type: FirebaseModelType.firestore);

    // A reference should not exist at this point and since the item is created manually,
    // it needs to be referenced in [ReferencedModel], so dispose doesn't throw.
    ReferencedModel.addRef(path: kDocumentPath, object: toggle);

    expect(futureToggle.synchronous, isTrue);
    expect(futureToggle.item, isNotNull);
    expect(futureToggle.future, isNotNull);
    expect(futureToggle.path, equals(kDocumentPath));
    expect(futureToggle.item?.path, equals(kDocumentPath));
    expect(futureToggle.item, equals(toggle));

    final futureToggleFuture = await futureToggle.future;

    expect(futureToggleFuture, equals(toggle));
    expect(futureToggleFuture, equals(futureToggle.item));

    futureToggle.dispose();
  });

  test('The item and future is unreferenced, when the FutureItem is disposed', () {
    final toggle = Toggle()..reference = _getMockReference(kDocumentPath);
    final futureToggle = FutureItem<Toggle>.of(item: toggle, type: FirebaseModelType.firestore);

    // A reference should not exist at this point and since the item is created manually,
    // it needs to be referenced in [ReferencedModel], so dispose doesn't throw.
    ReferencedModel.addRef(path: kDocumentPath, object: toggle);

    expect(futureToggle.synchronous, isTrue);
    expect(futureToggle.item, isNotNull);
    expect(futureToggle.future, isNotNull);

    futureToggle.dispose();

    expect(futureToggle.item, isNull);
    expect(futureToggle.future, isNull);
  });

  test('Asynchronous item is disposed, if it arrived after the FutureItem was disposed', () async {
    final futureToggle = FutureItem<Toggle>(path: kDocumentPath, type: FirebaseModelType.firestore);
    expect(ReferencedModel.isReferenced(kDocumentPath), isTrue, reason: 'The item must be referenced');

    futureToggle.dispose();

    // Wait 1 tick for the [FutureItem] to await the late fetch and dispose it.
    await Future<void>.value();
    expect(ReferencedModel.isReferenced(kDocumentPath), isFalse, reason: 'The item must be unreferenced');
  });
}
