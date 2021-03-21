import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Convert Firestore's [Timestamp] to json.
class FirestoreTimestampConverter implements JsonConverter<Timestamp?, dynamic> {
  /// Creates [FirestoreTimestampConverter].
  const FirestoreTimestampConverter();

  /// Convert json to firestore [Timestamp].
  @override
  Timestamp? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is Timestamp) {
      return json;
    } else if (json is num) {
      return Timestamp.fromMillisecondsSinceEpoch(json.toInt());
    } else if (json is Map<String, dynamic>) {
      final seconds = json['_seconds'] as int?;
      final nanoseconds = json['_nanoseconds'] as int?;

      return seconds != null || nanoseconds != null ? Timestamp(seconds ?? 0, nanoseconds ?? 0) : null;
    }

    return null;
  }

  /// Convert [Timestamp] to json.
  @override
  dynamic toJson(Timestamp? object) => object;
}

/// Convert Flutter's [Duration] to an int in milliseconds.
class FirestoreDurationConverter implements JsonConverter<Duration?, dynamic> {
  /// Creates [FirestoreDurationConverter].
  const FirestoreDurationConverter();

  @override
  Duration? fromJson(dynamic json) => json != null && json is int ? Duration(milliseconds: json) : null;

  @override
  dynamic toJson(Duration? object) => object?.inMilliseconds;
}

/// Serializes new lines in Firebase strings.
class StringWithLineBreaksConverter implements JsonConverter<String?, String?> {
  /// Creates [StringWithLineBreaksConverter].
  const StringWithLineBreaksConverter();

  @override
  String? fromJson(String? json) => json?.replaceAll('\\n', '\n');

  @override
  String? toJson(String? object) => object?.replaceAll('\n', '\\n');
}

/// Uses [RegExp] to remove redundant lines from the string.
///
/// This only affects `fromJson` - `toJson` will not change the string.
class StringWithNoRedundantLinesConverter implements JsonConverter<String?, String?> {
  /// Creates [StringWithNoRedundantLinesConverter].
  const StringWithNoRedundantLinesConverter();

  static final _redundantNewLineRegExp = RegExp(r'\n+');

  @override
  String? fromJson(String? json) => json?.replaceAll(_redundantNewLineRegExp, '\n');

  @override
  String? toJson(String? object) => object;
}
