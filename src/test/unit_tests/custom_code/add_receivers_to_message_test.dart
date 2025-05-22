import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esof_project/custom_code/actions/add_receivers_to_message.dart';

void main() {
  test('adds receivers to message document', () async {

    final firestore = FakeFirebaseFirestore();

    final messageRef = firestore.collection('messages').doc('testMessage');
    await messageRef.set({'content': 'Hello'});
    final user1 = firestore.collection('users').doc('user1');
    final user2 = firestore.collection('users').doc('user2');

    await addReceiversToMessage([user1, user2], messageRef);

    final updatedDoc = await messageRef.get();
    final receivers = List<DocumentReference>.from(updatedDoc.data()?['receivers'] ?? []);

    expect(receivers.length, 2);
    expect(receivers, contains(user1));
    expect(receivers, contains(user2));
  });
}
