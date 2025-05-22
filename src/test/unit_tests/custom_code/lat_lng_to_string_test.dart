import 'package:flutter_test/flutter_test.dart';
import 'package:esof_project/custom_code/actions/lat_lng_to_string.dart'; 
import 'package:esof_project/flutter_flow/lat_lng.dart';


void main() {
    test('correctly formats latitude and longitude', () {
      final location = LatLng(40.7128, -74.0060);
      final result = latLngToString(location);
      expect(result, '40.7128,-74.006');
    });

    test('handles zero values correctly', () {
      final location = LatLng(0.0, 0.0);
      final result = latLngToString(location);
      expect(result, '0.0,0.0');
    });

    test('handles negative latitude and longitude', () {
      final location = LatLng(-33.865143, -151.209900);
      final result = latLngToString(location);
      expect(result, '-33.865143,-151.2099');
    });
}
