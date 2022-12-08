// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Publication _$$_PublicationFromJson(Map<String, dynamic> json) =>
    _$_Publication(
      id: json['id'] as String,
      trackId: json['trackId'] as String?,
      track: json['track'] as String?,
      title: json['title'] as String?,
      authors: json['authors'] as String?,
      submitted: json['submitted'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      formFields: json['formFields'] as String?,
      keywords: json['keywords'] as String?,
      decision: json['decision'] as String?,
      notified: json['notified'] as String?,
      reviewsSent: json['reviewsSent'] as String?,
      publicationAbstract: json['publicationAbstract'] as String?,
      organization: json['organization'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      chair: json['chair'] as String?,
    );

Map<String, dynamic> _$$_PublicationToJson(_$_Publication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackId': instance.trackId,
      'track': instance.track,
      'title': instance.title,
      'authors': instance.authors,
      'submitted': instance.submitted,
      'lastUpdated': instance.lastUpdated,
      'formFields': instance.formFields,
      'keywords': instance.keywords,
      'decision': instance.decision,
      'notified': instance.notified,
      'reviewsSent': instance.reviewsSent,
      'publicationAbstract': instance.publicationAbstract,
      'organization': instance.organization,
      'location': instance.location,
      'date': instance.date,
      'time': instance.time,
      'chair': instance.chair,
    };
