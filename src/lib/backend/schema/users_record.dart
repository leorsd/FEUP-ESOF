import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_security" field.
  bool? _isSecurity;
  bool get isSecurity => _isSecurity ?? false;
  bool hasIsSecurity() => _isSecurity != null;

  // "faculty" field.
  String? _faculty;
  String get faculty => _faculty ?? '';
  bool hasFaculty() => _faculty != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "carsRegistered" field.
  List<DocumentReference>? _carsRegistered;
  List<DocumentReference> get carsRegistered => _carsRegistered ?? const [];
  bool hasCarsRegistered() => _carsRegistered != null;

  // "up_number" field.
  String? _upNumber;
  String get upNumber => _upNumber ?? '';
  bool hasUpNumber() => _upNumber != null;

  // "favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isSecurity = snapshotData['is_security'] as bool?;
    _faculty = snapshotData['faculty'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _carsRegistered = getDataList(snapshotData['carsRegistered']);
    _upNumber = snapshotData['up_number'] as String?;
    _favorites = getDataList(snapshotData['favorites']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  bool? isSecurity,
  String? faculty,
  String? photoUrl,
  String? phoneNumber,
  String? displayName,
  String? upNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'is_security': isSecurity,
      'faculty': faculty,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'display_name': displayName,
      'up_number': upNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isSecurity == e2?.isSecurity &&
        e1?.faculty == e2?.faculty &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.carsRegistered, e2?.carsRegistered) &&
        e1?.upNumber == e2?.upNumber &&
        listEquality.equals(e1?.favorites, e2?.favorites);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.createdTime,
        e?.isSecurity,
        e?.faculty,
        e?.photoUrl,
        e?.phoneNumber,
        e?.displayName,
        e?.carsRegistered,
        e?.upNumber,
        e?.favorites
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
