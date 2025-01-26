// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:mediapp/consts/strings.dart';
// // import 'package:mediapp/controllers/auth_controller.dart';
// // import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
// // import 'package:mediapp/views/book_appointment_view/appointment_view_by%20doctor.dart';
// // import 'package:mediapp/views/home_view/home.dart';
// // import 'package:mediapp/views/home_view/homeview.dart';
// // import 'package:mediapp/views/signupview.dart';
// // import 'package:velocity_x/velocity_x.dart';
// //
// //
// // import '../../resources/components/custom_buttom.dart';
// // import '../../resources/components/custom_textfield.dart';
// //
// // class LoginViews extends StatefulWidget {
// //   const LoginViews({super.key});
// //
// //   @override
// //   State<LoginViews> createState() => _LoginViewsState();
// // }
// //
// // class _LoginViewsState extends State<LoginViews> {
// //  var isDoctor =false;
// //   @override
// //   Widget build(BuildContext context) {
// //     var controller=Get.put(AuthController());
// //
// //     return Scaffold(
// //       body: Container(
// //         padding: EdgeInsets.all(8),
// //
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Container(
// //                // height: 150,
// //
// //                 color: Colors.white,
// //                 child: Image.asset("assets/images/Login-rafiki.png",width: double.infinity,fit: BoxFit.cover,),
// //               ),10.heightBox,
// //               AppStrings.welcomeBack.text.size(18).make(),
// //               AppStrings.weAreExcited.text.make(),
// //               10.heightBox,
// //               SingleChildScrollView(
// //                 child: Expanded(
// //                   flex:2,
// //                   child:Form(
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       CustomTextfield(hint: AppStrings.email,textController: controller.emailController,),
// //                       10.heightBox,
// //                       CustomTextfield(hint: AppStrings.password,textController: controller.passwordController,),
// //                       10.heightBox,
// //                       SwitchListTile(value: isDoctor, onChanged: (newValue){
// //                         setState(() {
// //                           isDoctor=newValue;
// //                         });
// //                       },
// //                         title: "Sign in as a doctor".text.size(18).color(Colors.blue).make(),
// //                       ),
// //                       20.heightBox,
// //                       Align(
// //                         alignment: Alignment.centerRight,
// //                         child: AppStrings.forgotPassword.text.make(),
// //                       ),20.heightBox,
// //                       CustomButtom(
// //                         onTap:()async{
// //                         await controller.loginUser();
// //                         if(controller.userCredential!=null){
// //                          if(isDoctor){
// //                            Get.to(()=>AppointmentViewByDoctor());
// //                          }else{
// //                            //signing as a user
// //                            Get.to(()=>Home());
// //                          }
// //                         }
// //
// //                       } ,buttonText: AppStrings.login,),
// //                       20.heightBox,
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           AppStrings.dontHaveAnAccount.text.make(),
// //                           5.widthBox,
// //                           GestureDetector(
// //                             onTap: (){
// //                               Get.to(()=>Signupview());
// //                             },
// //                               child: AppStrings.signup.text.bold.color(Colors.blue).make()),
// //                         ],
// //                       )
// //
// //
// //                     ],
// //                   )),),
// //               )
// //             ],
// //           ),
// //         ),
// //
// //       ),
// //
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mediapp/consts/strings.dart';
// import 'package:mediapp/controllers/auth_controller.dart';
// import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
// import 'package:mediapp/views/book_appointment_view/appointment_view_by%20doctor.dart';
// import 'package:mediapp/views/home_view/home.dart';
// import 'package:mediapp/views/signupview.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../resources/components/custom_buttom.dart';
// import '../../resources/components/custom_textfield.dart';
//
// class LoginViews extends StatefulWidget {
//   const LoginViews({super.key});
//
//   @override
//   State<LoginViews> createState() => _LoginViewsState();
// }
//
// class _LoginViewsState extends State<LoginViews> {
//   var isDoctor = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.white,
//                 child: Image.asset(
//                   "assets/images/Login-rafiki.png",
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               10.heightBox,
//               AppStrings.welcomeBack.text.size(18).make(),
//               AppStrings.weAreExcited.text.make(),
//               10.heightBox,
//               SingleChildScrollView(
//                 child: Expanded(
//                   flex: 2,
//                   child: Form(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomTextfield(
//                           hint: AppStrings.email,
//                           textController: controller.emailController,
//                         ),
//                         10.heightBox,
//                         CustomTextfield(
//                           hint: AppStrings.password,
//                           textController: controller.passwordController,
//                         ),
//                         10.heightBox,
//                         SwitchListTile(
//                           value: isDoctor,
//                           onChanged: (newValue) {
//                             setState(() {
//                               isDoctor = newValue;
//                             });
//                           },
//                           title: "Sign in as a doctor"
//                               .text
//                               .size(18)
//                               .color(Colors.blue)
//                               .make(),
//                         ),
//                         20.heightBox,
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: AppStrings.forgotPassword.text.make(),
//                         ),
//                         20.heightBox,
//                         CustomButtom(
//                           onTap: () async {
//                             // Validation for empty fields
//                             if (controller.emailController.text.isEmpty) {
//                               Get.snackbar(
//                                 "Error",
//                                 "Please enter your email",
//                                 backgroundColor: Colors.red,
//                                 colorText: Colors.white,
//                               );
//                             } else if (controller.passwordController.text.isEmpty) {
//                               Get.snackbar(
//                                 "Error",
//                                 "Please enter your password",
//                                 backgroundColor: Colors.red,
//                                 colorText: Colors.white,
//                               );
//                             } else {
//                               try {
//                                 await controller.loginUser();
//                                 if (controller.userCredential != null) {
//                                   if (isDoctor) {
//                                     Get.to(() => AppointmentViewByDoctor());
//                                   } else {
//                                     // Signing as a user
//                                     Get.to(() => Home());
//                                   }
//                                 }
//                               } catch (e) {
//                                 // If login fails due to incorrect email or password
//                                 Get.snackbar(
//                                   "Login Failed",
//                                   "Incorrect email or password. Please try again.",
//                                   backgroundColor: Colors.red,
//                                   colorText: Colors.white,
//                                 );
//                               }
//                             }
//                           },
//                           buttonText: AppStrings.login,
//                         ),
//                         20.heightBox,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             AppStrings.dontHaveAnAccount.text.make(),
//                             5.widthBox,
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(() => Signupview());
//                               },
//                               child: AppStrings.signup.text
//                                   .bold
//                                   .color(Colors.blue)
//                                   .make(),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/views/home_view/home.dart';
import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
import 'package:mediapp/views/book_appointment_view/appointment_view_by%20doctor.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../resources/components/custom_buttom.dart';
import '../../resources/components/custom_textfield.dart';
import '../signupview.dart';

class LoginViews extends StatefulWidget {
  const LoginViews({super.key});

  @override
  State<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Image.asset(
                  "assets/images/Login-rafiki.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              10.heightBox,
              AppStrings.welcomeBack.text.size(18).make(),
              AppStrings.weAreExcited.text.make(),
              10.heightBox,
              SingleChildScrollView(
                child: Expanded(
                  flex: 2,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextfield(
                          hint: AppStrings.email,
                          textController: controller.emailController,
                        ),
                        10.heightBox,
                        CustomTextfield(
                          hint: AppStrings.password,
                          textController: controller.passwordController,
                        ),
                        10.heightBox,
                        SwitchListTile(
                          value: isDoctor,
                          onChanged: (newValue) {
                            setState(() {
                              isDoctor = newValue;
                            });
                          },
                          title: "Sign in as a doctor"
                              .text
                              .size(18)
                              .color(Colors.blue)
                              .make(),
                        ),
                        20.heightBox,
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppStrings.forgotPassword.text.make(),
                        ),
                        20.heightBox,
                        CustomButtom(
                          onTap: () async {
                            // Validate email and password before logging in
                            if (controller.emailController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter your email",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (controller.passwordController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter your password",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else {
                              // Attempt login
                              await controller.loginUser();
                              if (controller.userCredential != null) {
                                // Successfully logged in
                                if (isDoctor) {
                                  Get.to(() => AppointmentViewByDoctor());
                                } else {
                                  // Sign in as a regular user
                                  Get.to(() => Home());
                                }
                              } else {
                                // Show toast if login fails (user not found or incorrect password)
                                Get.snackbar(
                                  "Login Failed",
                                  "User not found or incorrect password",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            }
                          },
                          buttonText: AppStrings.login,
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStrings.dontHaveAnAccount.text.make(),
                            5.widthBox,
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Signupview());
                              },
                              child: AppStrings.signup.text.bold.color(Colors.blue).make(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
