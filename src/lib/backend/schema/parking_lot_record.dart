import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingLotRecord extends FirestoreRecord {
  ParkingLotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "faculty" field.
  String? _faculty;
  String get faculty => _faculty ?? '';
  bool hasFaculty() => _faculty != null;

  // "currentAvailability" field.
  int? _currentAvailability;
  int get currentAvailability => _currentAvailability ?? 0;
  bool hasCurrentAvailability() => _currentAvailability != null;

  // "maxAvailability" field.
  int? _maxAvailability;
  int get maxAvailability => _maxAvailability ?? 0;
  bool hasMaxAvailability() => _maxAvailability != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "locationText" field.
  String? _locationText;
  String get locationText => _locationText ?? '';
  bool hasLocationText() => _locationText != null;

  void _initializeFields() {
    _faculty = snapshotData['faculty'] as String?;
    _currentAvailability = castToType<int>(snapshotData['currentAvailability']);
    _maxAvailability = castToType<int>(snapshotData['maxAvailability']);
    _location = snapshotData['location'] as LatLng?;
    _image = snapshotData['image'] as String?;
    _locationText = snapshotData['locationText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parkingLot');

  static Stream<ParkingLotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingLotRecord.fromSnapshot(s));

  static Future<ParkingLotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingLotRecord.fromSnapshot(s));

  static ParkingLotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingLotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingLotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingLotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingLotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingLotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingLotRecordData({
  String? faculty,
  int? currentAvailability,
  int? maxAvailability,
  LatLng? location,
  String? image,
  String? locationText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'faculty': faculty,
      'currentAvailability': currentAvailability,
      'maxAvailability': maxAvailability,
      'location': location,
      'image': image,
      'locationText': locationText,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingLotRecordDocumentEquality implements Equality<ParkingLotRecord> {
  const ParkingLotRecordDocumentEquality();

  @override
  bool equals(ParkingLotRecord? e1, ParkingLotRecord? e2) {
    return e1?.faculty == e2?.faculty &&
        e1?.currentAvailability == e2?.currentAvailability &&
        e1?.maxAvailability == e2?.maxAvailability &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.locationText == e2?.locationText;
  }

  @override
  int hash(ParkingLotRecord? e) => const ListEquality().hash([
        e?.faculty,
        e?.currentAvailability,
        e?.maxAvailability,
        e?.location,
        e?.image,
        e?.locationText
      ]);

  @override
  bool isValidKey(Object? o) => o is ParkingLotRecord;
}
