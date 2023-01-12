import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/NavAdd2page.dart';
import 'package:my_application/Ui/viewsAll/mainHomePage.dart';

class UsersAdd {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  sendFormDataAdd(
    String OwnerName,
    String cost,
    String Facilitis,
    String Description,
    String Destination,
  ) async {
    try {
      CollectionReference _course =
          FirebaseFirestore.instance.collection("uploads");
      _course.doc(_auth.currentUser!.email).set({
        'OwnerName': 'OwnerName',
        'cost': cost,
        'Facilitis': Facilitis,
        'Description': Description,
        'Destination': Destination,
      }).whenComplete(
        () {
          Fluttertoast.showToast(msg: "Added Successfully");
          Get.to(() => NavAdd2Page());
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "error: $e");
    }
  }
}
