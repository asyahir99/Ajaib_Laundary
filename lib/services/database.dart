import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ajaib_laundary/model/Users.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  List<UserData> users = [];
  final CollectionReference user =
      FirebaseFirestore.instance.collection("Users");

  Future<void> updateUserData(String name, String email) async {
    return await user.doc(uid).set({
      'name': name,
      'email': email,
    });
  }
}
