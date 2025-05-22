import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:esof_project/custom_code/actions/delete_message_if_no_receivers.dart'; 

void main() {
    late FakeFirebaseFirestore firestore;

    setUp(() {
      firestore = FakeFirebaseFirestore();
    });

    test('deletes the message if receivers list is empty', () async {
      final messageRef = firestore.collection('messages').doc('msg1');
      await messageRef.set({'receivers': []}); 

      await deleteMessageIfNoReceivers(messageRef);

      final docSnapshot = await messageRef.get();
      expect(docSnapshot.exists, false);
    });

    test('does not delete the message if receivers list is non-empty', () async {
      final messageRef = firestore.collection('messages').doc('msg2');
      final userRef = firestore.collection('users').doc('user1');

      await messageRef.set({
        'receivers': [userRef],
      });

      await deleteMessageIfNoReceivers(messageRef);

      final docSnapshot = await messageRef.get();
      expect(docSnapshot.exists, true); 
    });

    test('does not delete the message if receivers field is missing', () async {
      final messageRef = firestore.collection('messages').doc('msg3');
      await messageRef.set({'content': 'hello'});

      await deleteMessageIfNoReceivers(messageRef);

      final docSnapshot = await messageRef.get();
      expect(docSnapshot.exists, true); 
    });

    test('does not throw if document does not exist', () async {
      final messageRef = firestore.collection('messages').doc('nonexistent');

      await deleteMessageIfNoReceivers(messageRef);

      final docSnapshot = await messageRef.get();
      expect(docSnapshot.exists, false);
    });
}
