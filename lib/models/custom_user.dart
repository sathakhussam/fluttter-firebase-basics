import 'package:eb_bill/utils/firestore.dart';

class CustomUser {
  final uid;
  final email;
  String name = '';
  CustomUser(this.uid, this.email);

  saveToFirestore(CustomUser user) {
    print("Initialized");
    UserDataFirestore(user).saveToFireStore();
  }

  addName(String name, CustomUser user) {
    UserDataFirestore(user).addName(name);
  }
}
