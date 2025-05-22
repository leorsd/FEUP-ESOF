import 'package:flutter_test/flutter_test.dart';
import 'package:esof_project/flutter_flow/lat_lng.dart';

void main() {
  test('equality operator returns true for same latitude and longitude', () {
    final point1 = LatLng(10.0, 20.0);
    final point2 = LatLng(10.0, 20.0);
    expect(point1 == point2, isTrue);
  });

  test('equality operator returns false for different latitude', () {
    final point1 = LatLng(10.0, 20.0);
    final point2 = LatLng(11.0, 20.0);
    expect(point1 == point2, isFalse);
  });

  test('equality operator returns false for different longitude', () {
    final point1 = LatLng(10.0, 20.0);
    final point2 = LatLng(10.0, 21.0);
    expect(point1 == point2, isFalse);
  });

  test('hashCode is consistent for equal objects', () {
    final point1 = LatLng(10.0, 20.0);
    final point2 = LatLng(10.0, 20.0);
    expect(point1.hashCode, point2.hashCode);
  });

  test('serialize returns correct string', () {
    final point = LatLng(10.0, 20.0);
    expect(point.serialize(), '10.0,20.0');
  });

  test('toString returns descriptive string', () {
    final point = LatLng(10.0, 20.0);
    expect(point.toString(), 'LatLng(lat: 10.0, lng: 20.0)');
  });
}
