// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ParkingLotRecord>> sortItems(
    List<DocumentReference> refs, String method) async {
  final snapshots = await Future.wait(refs.map((ref) => ref.get()));

  final records =
      snapshots.map((snap) => ParkingLotRecord.fromSnapshot(snap)).toList();

  records.sort((a, b) {
    dynamic aValue;
    dynamic bValue;
    bool asc;

    switch (method) {
      case 'faculty-asc':
        aValue = a.faculty;
        bValue = b.faculty;
        asc = true;
        break;
      case 'currentAvailability-asc':
        aValue = a.currentAvailability;
        bValue = b.currentAvailability;
        asc = true;
        break;
      case 'maxAvailability-asc':
        aValue = a.maxAvailability;
        bValue = b.maxAvailability;
        asc = true;
        break;
      case 'faculty-desc':
        aValue = a.faculty;
        bValue = b.faculty;
        asc = false;
        break;
      case 'currentAvailability-desc':
        aValue = a.currentAvailability;
        bValue = b.currentAvailability;
        asc = false;
        break;
      case 'maxAvailability-desc':
        aValue = a.maxAvailability;
        bValue = b.maxAvailability;
        asc = false;
        break;
      default:
        aValue = a.currentAvailability;
        bValue = b.currentAvailability;
        asc = true;
        break;
    }

    if (aValue is Comparable && bValue is Comparable) {
      return (asc) ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
    }
    return 0;
  });

  return records;
}
