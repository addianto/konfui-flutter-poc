import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'models.dart';

final _log = Logger('publication/api');

// URI example: Uri.https('asia-northeast1-qir-ftui.cloudfunctions.net', '/publications');

Future<List<Publication>> getPublications(Uri uri) async {
  List<Publication> publications = List.empty();

  try {
    final response = await http.get(
      uri,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/vnd.api+json',
      },
    );
    _log.fine('HTTP response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var dataPayload = jsonResponse['data'] as List<dynamic>;
      _log.fine('# of items in the raw data: ${dataPayload.length}');

      try {
        publications = dataPayload.map((e) => Publication.fromJson(e)).toList();
      } catch (exception) {
        _log.severe('Failed parsing raw JSON into data objects', exception);
        return Future.error(exception);
      }
    }
  } on http.ClientException catch (exception) {
    _log.severe('Failed retrieving data from ${exception.uri}', exception);
    return Future.error(exception);
  }

  _log.fine('# of items in the parsed data: ${publications.length}');

  return publications;
}
