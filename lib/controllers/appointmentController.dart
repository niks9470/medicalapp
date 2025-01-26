import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;

  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  // var docName="".obs;

  bookAppointment(String docId, String docName, context) async {
    if (appDayController.text.isEmpty ||
        appTimeController.text.isEmpty ||
        appMobileController.text.isEmpty ||
        appNameController.text.isEmpty) {
      VxToast.show(context,
          msg: "All fields are required!",
          bgColor: Colors.red,
          textColor: Colors.white,
          textSize: 16);
      return;
    }

    try {
      isLoading(true);

      var store = FirebaseFirestore.instance.collection('appointments').doc();
      await store.set({
        'appBy': FirebaseAuth.instance.currentUser?.uid,
        'appDay': appDayController.text,
        'appTime': appTimeController.text,
        'appMobile': appMobileController.text,
        'appName': appNameController.text,
        'appMessage': appMessageController.text, // Fixed to use .text
        'appWith': docId,
        'appWithName': docName,
        'timestamp': FieldValue.serverTimestamp(), // Add timestamp for tracking
      });
      print("Appointment booked for ${FirebaseAuth.instance.currentUser?.uid} with Doctor ID: $docId");


      isLoading(false);
      VxToast.show(context,
          msg: "Appointment booked successfully!",
          bgColor: Colors.green,
          textColor: Colors.white,
          textSize: 16);
      Get.back();
    } catch (e) {
      isLoading(false);
      VxToast.show(context, msg: "Something went wrong. Please try again!");
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(bool isDoctor) {
   if(isDoctor){
     return FirebaseFirestore.instance
         .collection('appointments')
         .where('appWith',
         isEqualTo: FirebaseAuth.instance.currentUser?.uid)
         .get();
   }else{
     return FirebaseFirestore.instance
         .collection('appointments')
         .where('appBy',
         isEqualTo: FirebaseAuth.instance.currentUser?.uid)
         .get();
   }
  }
}
