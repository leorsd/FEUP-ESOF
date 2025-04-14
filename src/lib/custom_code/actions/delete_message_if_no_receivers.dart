// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> deleteMessageIfNoReceivers(DocumentReference messageRef) async {
  final docSnapshot = await messageRef.get();

  if (!docSnapshot.exists) return;

  final data = docSnapshot.data() as Map<String, dynamic>?;
  if (data == null) return;

  final receivers = data['receivers'];
  if (receivers is List && receivers.isEmpty) {
    await messageRef.delete();
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
