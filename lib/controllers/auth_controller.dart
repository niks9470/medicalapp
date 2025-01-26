import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
import 'package:mediapp/views/home_view/home.dart';
import 'package:mediapp/views/login_view/login_views.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
//doctors
  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var servicesController = TextEditingController();
  var timingController = TextEditingController();
  var endTimingController=TextEditingController();
  var phoneController = TextEditingController();
  var categoryController = TextEditingController();
  UserCredential? userCredential;



  isUserAlreadyLoggedIn()async{
    await FirebaseAuth.instance.authStateChanges().listen((User?user) async {

      if(user!=null){
        var data= await FirebaseFirestore.instance.collection('doctors').doc(user.uid).get();
        var isDoc=data.data()?.containsKey('docName')??false;
        if(isDoc){
          Get.off(()=>AppoinmentView());
        }else
          {
            Get.offAll(()=>Home());

          }


      }else{
        Get.offAll(()=>LoginViews());
      }

    });
  }



  loginUser()async{
    userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

  }



  signupUser(bool isDoctor) async {
    // UserCredential? userCredential;

    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    // if(userCredential!=null){
    await storeUserData(userCredential!.user!.uid, fullnameController.text,
        emailController.text,isDoctor);
  }

  storeUserData(String uid, String fullname, String email,bool isDoctor) async {
    var store = FirebaseFirestore.instance.collection(
        isDoctor ? 'doctors' : 'users').doc(uid);
    if (isDoctor) {
      await store.set({
        'docAbout': aboutController.text,
        'docAddress': addressController.text,
        'docCategory': categoryController.text,
        'docName': fullname,
        'docPhone': phoneController.text,
        'docServices': servicesController.text,
      'docTiming': timingController.text.isEmpty ? 'Not Set' : timingController.text,
      'docEndTiming': endTimingController.text.isEmpty ? 'Not Set' :endTimingController.text,
        'docId': FirebaseAuth.instance.currentUser?.uid,
        'docRating': 3,
        'docEmail': email
      });
    } else {
      await store.set({'fullname': fullname, 'email': email,});
    }
  }

  signout()async{
    await FirebaseAuth.instance.signOut();
  }
}
