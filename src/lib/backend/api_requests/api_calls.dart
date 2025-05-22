import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DistanceParkCall {
  static Future<ApiCallResponse> call({
    String? destinations = '',
    String? origins = '',
    String? mode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DistancePark',
      apiUrl: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'destinations': destinations,
        'origins': origins,
        'key': "AIzaSyAK-pSqt2_oh4fJjMTYXUTEPGVoFCSonBo",
        'mode': mode,
        'language': "en",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
  static String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class PlacesInfoCall {
  static Future<ApiCallResponse> call({
    String? searchTerm = '',
  }) async {
    final ffApiRequestBody = '''
{
  "textQuery": "${escapeStringForJson(searchTerm)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'placesInfo',
      apiUrl: 'https://places.googleapis.com/v1/places:searchText',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': 'AIzaSyAK-pSqt2_oh4fJjMTYXUTEPGVoFCSonBo',
        'X-Goog-FieldMask': 'places.rating,places.accessibilityOptions',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? rating(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.places[0].rating''',
      ));
  static bool? accesibilityParking(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.places[0].accessibilityOptions.wheelchairAccessibleParking''',
      ));
}

class WeatherCall {
  static Future<ApiCallResponse> call({
    String? q = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'weather',
      apiUrl:
          'https://api.weatherapi.com/v1/current.json?key=b84cd4245ac742dfb76230653252105',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? icon(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.current.condition.icon''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
