import 'package:firestore_model/firestore_model.dart';
import 'package:mobx/mobx.dart';

part 'realtime_variable.g.dart';

/// [RealtimeVariable] allows reference counted subscription to a single value
/// inside Realtime Database.
class RealtimeVariable extends _RealtimeVariable with _$RealtimeVariable {
  /// Deserializes [RealtimeVariable].
  static RealtimeVariable fromJson(dynamic value) => RealtimeVariable()..value;

  /// Serializes [RealtimeVariable].
  dynamic toJson() => value;
}

abstract class _RealtimeVariable extends RealtimeModel<RealtimeVariable> with Store {
  @o dynamic value;

  @override @a
  void onSnapshot(RealtimeVariable x) {
    assert(x.snapshot != null, 'onSnapshot shouldn\'t have been called without a snapshot');
    value = x.snapshot!.value;
  }
}
