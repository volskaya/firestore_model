// ignore_for_file:public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Convert Firestore's [Timestamp] to json.
class TimestampC implements JsonConverter<Timestamp, dynamic> {
  /// Creates [TimestampC].
  const TimestampC();

  /// Convert json to firestore [Timestamp].
  @override
  Timestamp fromJson(dynamic json) {
    if (json is Timestamp) {
      return json;
    } else if (json is num) {
      return Timestamp.fromMillisecondsSinceEpoch(json.toInt());
    } else if (json is Map<String, dynamic>) {
      final seconds = json['_seconds'] as int?;
      final nanoseconds = json['_nanoseconds'] as int?;

      return Timestamp(seconds ?? 0, nanoseconds ?? 0);
    }

    return Timestamp(0, 0);
  }

  /// Convert [Timestamp] to json.
  @override
  dynamic toJson(Timestamp object) => object;
}

/// Convert Firestore's [Timestamp] to json.
class TimestampCN implements JsonConverter<Timestamp?, dynamic> {
  /// Creates [TimestampCN].
  const TimestampCN();

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

      return seconds != null || nanoseconds != null
          ? Timestamp(seconds ?? 0, nanoseconds ?? 0)
          : null;
    }

    return null;
  }

  /// Convert [Timestamp] to json.
  @override
  dynamic toJson(Timestamp? object) => object;
}

/// Convert Flutter's [Duration] to an int in milliseconds.
class DurationC implements JsonConverter<Duration, dynamic> {
  /// Creates [DurationC].
  const DurationC();

  @override
  Duration fromJson(dynamic json) =>
      json is int ? Duration(milliseconds: json) : Duration.zero;
  @override
  dynamic toJson(Duration object) => object.inMilliseconds;
}

/// Convert Flutter's [Duration] to an int in milliseconds.
class DurationCN implements JsonConverter<Duration?, dynamic> {
  /// Creates [DurationCN].
  const DurationCN();

  @override
  Duration? fromJson(dynamic json) =>
      json != null && json is int ? Duration(milliseconds: json) : null;
  @override
  dynamic toJson(Duration? object) => object?.inMilliseconds;
}

/// Serializes new lines in Firebase strings.
class LineBreaksC implements JsonConverter<String, String> {
  /// Creates [LineBreaksC].
  const LineBreaksC();

  @override
  String fromJson(String json) => json.replaceAll('\\n', '\n');
  @override
  String toJson(String object) => object.replaceAll('\n', '\\n');
}

/// Serializes new lines in Firebase strings.
class LineBreaksCN implements JsonConverter<String?, String?> {
  /// Creates [LineBreaksCN].
  const LineBreaksCN();

  @override
  String? fromJson(String? json) => json?.replaceAll('\\n', '\n');
  @override
  String? toJson(String? object) => object?.replaceAll('\n', '\\n');
}

/// Uses [RegExp] to remove redundant lines from the string.
///
/// This only affects `fromJson` - `toJson` will not change the string.
class NoRedundantLinesC implements JsonConverter<String, String> {
  /// Creates [NoRedundantLinesC].
  const NoRedundantLinesC();

  static final _redundantNewLineRegExp = RegExp(r'\n+');

  @override
  String fromJson(String json) =>
      json.replaceAll(_redundantNewLineRegExp, '\n');
  @override
  String toJson(String object) => object;
}

/// Uses [RegExp] to remove redundant lines from the string.
///
/// This only affects `fromJson` - `toJson` will not change the string.
class NoRedundantLinesCN implements JsonConverter<String?, String?> {
  /// Creates [NoRedundantLinesCN].
  const NoRedundantLinesCN();

  static final _redundantNewLineRegExp = RegExp(r'\n+');

  @override
  String? fromJson(String? json) =>
      json?.replaceAll(_redundantNewLineRegExp, '\n');
  @override
  String? toJson(String? object) => object;
}
