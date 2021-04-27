import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataFirestore {
  final user;
  final _firestore = FirebaseFirestore.instance;
  UserDataFirestore(this.user);

  saveToFireStore() async {
    await _firestore
        .collection('users')
        .doc(this.user.uid)
        .set({"email": this.user.email});
  }

  addName(name) async {
    await _firestore
        .collection('users')
        .doc(this.user.uid)
        .update({"name": name});
  }
}
