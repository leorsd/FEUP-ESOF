import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarRecord extends FirestoreRecord {
  CarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car_plate" field.
  String? _carPlate;
  String get carPlate => _carPlate ?? '';
  bool hasCarPlate() => _carPlate != null;

  // "references" field.
  int? _references;
  int get references => _references ?? 0;
  bool hasReferences() => _references != null;

  void _initializeFields() {
    _carPlate = snapshotData['car_plate'] as String?;
    _references = castToType<int>(snapshotData['references']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('car');

  static Stream<CarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarRecord.fromSnapshot(s));

  static Future<CarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarRecord.fromSnapshot(s));

  static CarRecord fromSnapshot(DocumentSnapshot snapshot) => CarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarRecordData({
  String? carPlate,
  int? references,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_plate': carPlate,
      'references': references,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarRecordDocumentEquality implements Equality<CarRecord> {
  const CarRecordDocumentEquality();

  @override
  bool equals(CarRecord? e1, CarRecord? e2) {
    return e1?.carPlate == e2?.carPlate && e1?.references == e2?.references;
  }

  @override
  int hash(CarRecord? e) =>
      const ListEquality().hash([e?.carPlate, e?.references]);

  @override
  bool isValidKey(Object? o) => o is CarRecord;
}
