// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// class SettingsController extends GetxController{
//   @override
//   void onInit() {
//     getData=getUserData();
//     // TODO: implement onInit
//     super.onInit();
//   }
//
//   var isLoading=false.obs;
//   var currentUser=FirebaseAuth.instance.currentUser;
//   var username="".obs;
//   var email="".obs;
//   Future?getData;
//
//   getUserData() async {
//     isLoading(true);
//     DocumentSnapshot<Map<String,dynamic>> user=
//         await FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).get();
//     var userData=user.data();
//     username.value=userData!['fullname']??"";
//     email.value=currentUser!.email??"";
//     isLoading(false);
//
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  @override
  void onInit() {
    getData = getUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  var username = "".obs;
  var email = "".obs;
  Future<void>? getData;

  Future<void> getUserData() async {
    if (currentUser == null) {
      // Handle case where currentUser is null
      print("No user is currently logged in.");
      return;
    }

    isLoading(true);
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser!.uid)
          .get();

      if (userDoc.exists) {
        // Safely access user data
        var userData = userDoc.data();
        username.value = userData?['fullname'] ?? "Unknown User";
        email.value = currentUser!.email ?? "No Email";
      } else {
        print("User document does not exist in Firestore.");
        username.value = "Unknown User";
        email.value = currentUser!.email ?? "No Email";
      }
    } catch (e) {
      // Handle Firestore errors
      print("Error fetching user data: $e");
    } finally {
      isLoading(false);
    }
  }
}
