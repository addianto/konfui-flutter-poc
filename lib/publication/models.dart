import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Publication with _$Publication {
  const factory Publication({
    required String id,
    required String? trackId,
    required String? track,
    required String? title,
    required String? authors,
    required String? submitted,
    required String? lastUpdated,
    required String? formFields,
    required String? keywords,
    required String? decision,
    required String? notified,
    required String? reviewsSent,
    required String? publicationAbstract,
    required String? organization,
    required String? location,
    required String? date,
    required String? time,
    required String? chair,
  }) = _Publication;

  factory Publication.fromJson(Map<String, Object?> json) =>
      _$PublicationFromJson(json);
}
