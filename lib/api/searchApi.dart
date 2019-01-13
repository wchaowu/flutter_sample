import 'package:joybuy.com/model/repo.dart';
import 'package:date_format/date_format.dart';

import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';

class Api {
  static final HttpClient _httpClient = HttpClient();
  static final String _url = "api.github.com";

  static Future<List<Repo>> getRepositoriesWithSearchQuery(String query) async {
    final uri = Uri.https(_url, '/search/repositories', {
      'q': query,
      'sort': 'stars',
      'order': 'desc',
      'page': '0',
      'per_page': '25'
    });

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['items'] == null) {
      return List();
    }

    return Repo.mapJSONStringToList(jsonResponse['items']);
  }

  static Future<List<Repo>> getTrendingRepositories() async {
    final lastWeek = DateTime.now().subtract(Duration(days: 7));
    final formattedDate = formatDate(lastWeek, [yyyy, '-', mm, '-', dd]);

    final uri = Uri.https(_url, '/search/repositories', {
      'q': 'created:>$formattedDate',
      'sort': 'stars',
      'order': 'desc',
      'page': '0',
      'per_page': '25'
    });

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['items'] == null) {
      return List();
    }

    return Repo.mapJSONStringToList(jsonResponse['items']);
  }

  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
