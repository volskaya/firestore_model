import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toggle.g.dart';

/// Model of collection toggles for [FirestoreToggle].
@JsonSerializable()
class Toggle extends _Toggle with _$Toggle {
  /// Creates json of [Toggle].
  Map toJson() => _$ToggleToJson(this);

  /// Creates [Toggle] from json.
  static Toggle fromJson(Map json) => _$ToggleFromJson(json);
}

abstract class _Toggle extends FirestoreModel<Toggle> with Store {
  @observable
  @JsonKey()
  @FirestoreTimestampConverterNullable()
  Timestamp? createTime;

  @override
  void onSnapshot(Toggle x) {
    createTime = x.createTime;
  }
}
