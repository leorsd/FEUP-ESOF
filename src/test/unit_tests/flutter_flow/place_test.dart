import 'package:flutter_test/flutter_test.dart';
import 'package:esof_project/flutter_flow/lat_lng.dart';
import 'package:esof_project/flutter_flow/place.dart';

void main() {
  final latLng1 = LatLng(10.0, 20.0);
  final latLng2 = LatLng(11.0, 21.0);

  test('equality operator returns true for identical properties', () {
    final place1 = FFPlace(
      latLng: latLng1,
      name: 'Name',
      address: 'Address',
      city: 'City',
      state: 'State',
      country: 'Country',
      zipCode: '12345',
    );
    final place2 = FFPlace(
      latLng: latLng1,
      name: 'Name',
      address: 'Address',
      city: 'City',
      state: 'State',
      country: 'Country',
      zipCode: '12345',
    );
    expect(place1 == place2, isTrue);
  });

  test('equality operator returns false for different latLng', () {
    final place1 = FFPlace(latLng: latLng1);
    final place2 = FFPlace(latLng: latLng2);
    expect(place1 == place2, isFalse);
  });

  test('equality operator returns false for different name', () {
    final place1 = FFPlace(name: 'Name1');
    final place2 = FFPlace(name: 'Name2');
    expect(place1 == place2, isFalse);
  });

  test('hashCode is same for equal objects', () {
    final place1 = FFPlace(latLng: latLng1);
    final place2 = FFPlace(latLng: latLng1);
    expect(place1.hashCode, place2.hashCode);
  });

  test('toString returns formatted string', () {
    final place = FFPlace(
      latLng: latLng1,
      name: 'Name',
      address: 'Address',
      city: 'City',
      state: 'State',
      country: 'Country',
      zipCode: '12345',
    );
    final str = place.toString();
    expect(str, contains('latLng: $latLng1'));
    expect(str, contains('name: Name'));
    expect(str, contains('address: Address'));
    expect(str, contains('city: City'));
    expect(str, contains('state: State'));
    expect(str, contains('country: Country'));
    expect(str, contains('zipCode: 12345'));
  });
}
