import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:esof_project/flutter_flow/uploaded_file.dart';

void main() {
  final sampleBytes = Uint8List.fromList([1, 2, 3, 4, 5]);

  final file = FFUploadedFile(
    name: 'file.png',
    bytes: sampleBytes,
    height: 100.0,
    width: 200.0,
    blurHash: 'LKO2?U%2Tw=^]-;~RBVZRi};RPxuwH',
  );

  test('toString returns correct description', () {
    final str = file.toString();
    expect(str, contains('name: file.png'));
    expect(str, contains('bytes: 5'));
    expect(str, contains('height: 100.0'));
    expect(str, contains('width: 200.0'));
    expect(str, contains('blurHash: LKO2?U%2Tw=^]-;~RBVZRi};RPxuwH'));
  });

  test('equality operator returns true for identical properties', () {
    final copy = FFUploadedFile(
      name: 'file.png',
      bytes: sampleBytes,
      height: 100.0,
      width: 200.0,
      blurHash: 'LKO2?U%2Tw=^]-;~RBVZRi};RPxuwH',
    );
    expect(file == copy, isTrue);
  });

  test('hashCode is consistent for equal objects', () {
    final copy = FFUploadedFile(
      name: 'file.png',
      bytes: sampleBytes,
      height: 100.0,
      width: 200.0,
      blurHash: 'LKO2?U%2Tw=^]-;~RBVZRi};RPxuwH',
    );
    expect(file.hashCode, equals(copy.hashCode));
  });

  test('deserialize handles missing bytes gracefully', () {
    final jsonStr = jsonEncode({
      'name': 'file.png',
      'height': 100.0,
      'width': 200.0,
      'blurHash': 'LKO2?U%2Tw=^]-;~RBVZRi};RPxuwH',
    });

    final result = FFUploadedFile.deserialize(jsonStr);
    expect(result.bytes, isA<Uint8List>());
    expect(result.bytes!.isEmpty, isTrue);
  });
}
