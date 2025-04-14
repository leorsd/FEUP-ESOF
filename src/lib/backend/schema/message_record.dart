import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "receivers" field.
  List<DocumentReference>? _receivers;
  List<DocumentReference> get receivers => _receivers ?? const [];
  bool hasReceivers() => _receivers != null;

  // "car_plate" field.
  String? _carPlate;
  String get carPlate => _carPlate ?? '';
  bool hasCarPlate() => _carPlate != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _receivers = getDataList(snapshotData['receivers']);
    _carPlate = snapshotData['car_plate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? sender,
  String? text,
  DateTime? date,
  String? carPlate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'text': text,
      'date': date,
      'car_plate': carPlate,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.sender == e2?.sender &&
        e1?.text == e2?.text &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.receivers, e2?.receivers) &&
        e1?.carPlate == e2?.carPlate;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.sender, e?.text, e?.date, e?.receivers, e?.carPlate]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
