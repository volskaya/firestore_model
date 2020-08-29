import 'package:firestore_model/firestore_model.dart';
import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toggle.g.dart';

/// Model of collection toggles for [FirestoreToggle].
@JsonSerializable()
class Toggle extends _Toggle with _$Toggle {
  /// Creates json of [Toggle].
  Map<String, dynamic> toJson() => _$ToggleToJson(this);

  /// Creates [Toggle] from json.
  static Toggle fromJson(Map<String, dynamic> json) => _$ToggleFromJson(json);
}

abstract class _Toggle extends FirestoreModel<Toggle> with Store {
  @override
  void onSnapshot(Toggle x) {}
}
