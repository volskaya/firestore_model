// ignore_for_file:unnecessary_parenthesis,invalid_use_of_protected_member

import 'package:firestore_model/src/utils/disposable_hook_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockHookState<R, T extends Hook<R>> extends Mock implements HookState<R, T> {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.off}) => hashCode.toString();
}

void main() {
  late MockHookState<dynamic, Hook<dynamic>> state;

  setUp(() {
    final mockContext = MockBuildContext();
    state = MockHookState<dynamic, Hook<dynamic>>();
    when(() => state.context).thenReturn(mockContext);
  });

  test('DisposableHookContext state is unreferenced, when the class is disposed', () {
    expect(state.context, isNotNull, reason: 'Hook\'s context should not be null');

    final disposableHookContext = DisposableHookContext(state);
    expect(disposableHookContext.context, isNotNull, reason: 'The context should not be null');

    disposableHookContext.dispose();
    expect(disposableHookContext.context, isNull, reason: 'The context should be null');
  });
}
