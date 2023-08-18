import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/user_model.dart';

final FirebaseStorage store = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
UserModel userModel = UserModel();

class StoreData {
  Future<String> uploadImageToStoreage(String childName, Uint8List file) async {
    Reference ref = store.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required String name,
    required String email,
    required Uint8List file,
  }) async {
    String resp = "Some Error Occurred";
    try {
      User? user = auth.currentUser!;
      userModel.uid = user.uid;
      userModel.email = email;
      userModel.name = name;
      userModel.imageUrl = await uploadImageToStoreage("ProfileImage", file);

      if (name.isNotEmpty || email.isNotEmpty) {
        await firestore.collection("users").doc(user.uid).set(
              userModel.toMap(),
            );
      }
      resp = "success";
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
