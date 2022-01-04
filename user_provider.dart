import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:padhaku_reader/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {User? currentUser,
      String? userName,
      String? userEmail,
      String? userImage,
      num? userWalletBalance,
      String? usermembership}) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser!.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userID": currentUser.uid,
        
      },
    );
  }

  late UserModel currentData;

  Future<void> getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get("userEmail"),
        userImage: value.get("userImage"),
        //userMembership: value.get("usermembership"),
        userName: value.get("userName"),
        userUid: value.get("userID"),
        //userWalletBalance: value.get("userWalletBalance"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
