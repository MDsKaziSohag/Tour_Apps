import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomNavMainPage.dart';
import 'package:my_application/Ui/viewsAll/home.dart';
import 'package:my_application/Ui/viewsAll/loging.dart';
import 'package:my_application/Ui/viewsAll/mainHomePage.dart';
import 'package:my_application/Ui/viewsAll/userFrom.dart';

progressDialog(context) => showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text("Processing"),
            ],
          ),
        ),
      ),
    );

class AuthHelper {
  final box = GetStorage();
  // email pass signUp
  Future SignUp(
    String emailAddress,
    String password,
    context,
  ) async {
    try {
      progressDialog(context);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        // add all the data
        await box.write('uid', authCredential.uid);
        await box.write('userEmail', emailAddress);

        Fluttertoast.showToast(msg: 'Success');

        Get.to(() => UserFromPage());
      } else {
        Get.back();
        Fluttertoast.showToast(
            msg: "Something is wrong", backgroundColor: Colors.black87);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //Get.back();
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Get.back();
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }

  // email pass signUIn
  Future login(String emailAddress, String password, context) async {
    try {
      //   progressDialog(context);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        await box.write('uid', authCredential.uid);
        Fluttertoast.showToast(msg: 'Login Successfull');
        Get.to( MainHomePage());
      } else {
        Fluttertoast.showToast(
            msg: "Something is wrong", backgroundColor: Colors.black87);
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
        Get.back();
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
        // Get.back();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
      Get.back();
    }
  }
}
