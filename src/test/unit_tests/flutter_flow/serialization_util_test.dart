import 'package:esof_project/flutter_flow/nav/serialization_util.dart';
import 'package:esof_project/flutter_flow/place.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:esof_project/flutter_flow/lat_lng.dart';

void main() {
  test('DateTimeRange serialization and deserialization', () {
    final range = DateTimeRange(
      start: DateTime(2023, 5, 21, 9),
      end: DateTime(2023, 5, 21, 17),
    );

    final serialized = dateTimeRangeToString(range);
    final deserialized = dateTimeRangeFromString(serialized);

    expect(deserialized?.start, range.start);
    expect(deserialized?.end, range.end);
  });

  test('Place serialization and deserialization', () {
    final place = FFPlace(
      latLng: LatLng(12.34, 56.78),
      name: 'Test Place',
      address: '123 Test St',
      city: 'Test City',
      state: 'TS',
      country: 'Testland',
      zipCode: '12345',
    );

    final serialized = placeToString(place);
    final deserialized = placeFromString(serialized);

    expect(deserialized.name, place.name);
    expect(deserialized.latLng.latitude, place.latLng.latitude);
    expect(deserialized.city, place.city);
  });

  test('serializeParam and deserializeParam with int', () {
    final value = 42;
    final serialized = serializeParam(value, ParamType.int);
    final deserialized = deserializeParam<int>(serialized, ParamType.int, false);
    expect(deserialized, value);
  });

  test('serializeParam and deserializeParam with bool', () {
    final value = true;
    final serialized = serializeParam(value, ParamType.bool);
    final deserialized = deserializeParam<bool>(serialized, ParamType.bool, false);
    expect(deserialized, value);
  });

  test('serializeParam with list of strings', () {
    final value = ['a', 'b', 'c'];
    final serialized = serializeParam(value, ParamType.String, isList: true);
    final deserialized = deserializeParam<String>(serialized, ParamType.String, true);
    expect(deserialized, value);
  });
}
