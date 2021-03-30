import 'dart:async';
import 'package:blue_scale/entity/DataAccess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blue_scale/entity/user.dart';



class LoginController{
  final auth = FirebaseAuth.instance;




  static Future<bool>  verifylogin(String email, String password) async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return Future<bool>.value(true);
  }

  static Future<bool>  verifyregistration(String email, String password, String cpassword) async {
    if (password !=cpassword)
      {
        return Future<bool>.value(false);
      }
    else {
      final auth = FirebaseAuth.instance;

      await auth.createUserWithEmailAndPassword(email: email, password: password);

      await DataAccess(uid: auth.currentUser.uid).updateUserData(email,null,null); // get user id and create new info in firestore that link to this id.

      return Future<bool>.value(true);
    }
  }

  static Future signOut() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  String getCurrentUID() {
    return auth.currentUser.uid;
  }

  Future  getCurrentUIDd() async {
    return auth.currentUser.uid;
  }


  // GET CURRENT USER
  Future getCurrentUser() async {
    return await auth.currentUser;
  }








}