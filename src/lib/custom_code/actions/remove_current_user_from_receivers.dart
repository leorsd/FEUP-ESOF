// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> removeCurrentUserFromReceivers(
    List<DocumentReference> messages) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    throw Exception('No authenticated user found.');
  }

  final currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

  for (final messageRef in messages) {
    final messageSnap = await messageRef.get();

    if (!messageSnap.exists) continue;

    final data = messageSnap.data() as Map<String, dynamic>?;

    if (data == null || !data.containsKey('receivers')) continue;

    final List<dynamic> receivers = data['receivers'];
    final updatedReceivers = receivers.where((ref) {
      return ref is DocumentReference && ref.path != currentUserRef.path;
    }).toList();

    await messageRef.update({'receivers': updatedReceivers});
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
