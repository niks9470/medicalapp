//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mediapp/consts/strings.dart';
// import 'package:mediapp/controllers/auth_controller.dart';
// import 'package:mediapp/views/home_view/home.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../resources/components/custom_buttom.dart';
// import '../../resources/components/custom_textfield.dart';
//
// class Signupview extends StatefulWidget {
//   const Signupview({super.key});
//
//   @override
//   State<Signupview> createState() => _SignupviewState();
// }
//
// class _SignupviewState extends State<Signupview> {
//   var isDoctor = false;
//   String? selectedCategory;
//
//   // List of categories for the dropdown
//   final List<String> categories = [
//     'Ear',
//     'Heart',
//     'Eye',
//     'Kidney',
//     'Lungs',
//     'Liver',
//   ];
//
//   // Function to show Time Picker
//   Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
//     TimeOfDay? selectedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (selectedTime != null) {
//       controller.text = selectedTime.format(context); // Set the selected time in the controller
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.blue,
//                 child: Image.asset(
//                   "assets/images/Welcome-rafiki.png",
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               10.heightBox,
//               "Sign up now and start exploring all \n that our app has to offer"
//                   .text
//                   .bold
//                   .center
//                   .size(15)
//                   .make(),
//               10.heightBox,
//
//               SingleChildScrollView(
//                 child: Expanded(
//                   flex: 2,
//                   child: Form(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomTextfield(
//                           hint: AppStrings.fullname,
//                           textController: controller.fullnameController,
//                         ),
//                         10.heightBox,
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
//                           title: "Sign up as a doctor"
//                               .text
//                               .size(18)
//                               .color(Colors.blue)
//                               .make(),
//                           value: isDoctor,
//                           onChanged: (newValue) {
//                             setState(() {
//                               isDoctor = newValue;
//                             });
//                           },
//                         ),
//
//                         // Category Dropdown
//                         Visibility(
//                           visible: isDoctor,
//                           child: Column(
//                             children: [
//                               DropdownButtonFormField<String>(
//                                 value: selectedCategory,
//                                 hint: Text("Select Category"),
//                                 items: categories.map((category) {
//                                   return DropdownMenuItem<String>(
//                                     value: category,
//                                     child: Text(category),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedCategory = value;
//                                     controller.categoryController.text = value!;
//                                   });
//                                 },
//                                 decoration: InputDecoration(
//                                   labelText: "Category",
//                                   border: OutlineInputBorder(),
//                                   contentPadding:
//                                   EdgeInsets.symmetric(horizontal: 10),
//                                 ),
//                               ),
//                               10.heightBox,
//                               CustomTextfield(
//                                 hint: "About",
//                                 textController: controller.aboutController,
//                               ),
//                               10.heightBox,
//                               CustomTextfield(
//                                 hint: "Services",
//                                 textController: controller.servicesController,
//                               ),
//                               10.heightBox,
//                               CustomTextfield(
//                                 hint: "Address",
//                                 textController: controller.addressController,
//                               ),
//                               10.heightBox,
//                               CustomTextfield(
//                                 hint: "Phone Number",
//                                 textController: controller.phoneController,
//                               ),
//                               10.heightBox,
//                               GestureDetector(
//                                 onTap: () => _selectTime(context, controller.timingController), // Open time picker for start time
//                                 child: AbsorbPointer(
//                                   child: CustomTextfield(
//                                     hint: "Start Timing",
//                                     textController: controller.timingController,
//                                   ),
//                                 ),
//                               ),
//                               10.heightBox,
//                               GestureDetector(
//                                 onTap: () => _selectTime(context, controller.endTimingController), // Open time picker for end time
//                                 child: AbsorbPointer(
//                                   child: CustomTextfield(
//                                     hint: "End Timing",
//                                     textController: controller.endTimingController,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         10.heightBox,
//
//                         20.heightBox,
//                         CustomButtom(
//                           onTap: () async {
//                             await controller.signupUser(isDoctor);
//                             if (controller.userCredential != null) {
//                               Get.offAll(() => Home());
//                             }
//                           },
//                           buttonText: AppStrings.signup,
//                         ),
//                         20.heightBox,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             AppStrings.alreadyHaveAccount.text.make(),
//                             5.widthBox,
//                             GestureDetector(
//                                 onTap: () {
//                                   Get.back();
//                                 },
//                                 child: AppStrings.login.text.bold
//                                     .color(Colors.blue)
//                                     .make()),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
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
import 'package:velocity_x/velocity_x.dart';
import '../../resources/components/custom_buttom.dart';
import '../../resources/components/custom_textfield.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  var isDoctor = false;
  String? selectedCategory;

  // List of categories for the dropdown
  final List<String> categories = [
    'Ear',
    'Heart',
    'Eye',
    'Kidney',
    'Lungs',
    'Liver',
  ];

  // Function to show Time Picker
  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      controller.text = selectedTime.format(context); // Set the selected time in the controller
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Image.asset(
                  "assets/images/Welcome-rafiki.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              10.heightBox,
              "Sign up now and start exploring all \n that our app has to offer"
                  .text
                  .bold
                  .center
                  .size(15)
                  .make(),
              10.heightBox,

              SingleChildScrollView(
                child: Expanded(
                  flex: 2,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextfield(
                          hint: AppStrings.fullname,
                          textController: controller.fullnameController,
                        ),
                        10.heightBox,
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
                          title: "Sign up as a doctor"
                              .text
                              .size(18)
                              .color(Colors.blue)
                              .make(),
                          value: isDoctor,
                          onChanged: (newValue) {
                            setState(() {
                              isDoctor = newValue;
                            });
                          },
                        ),

                        // Category Dropdown
                        Visibility(
                          visible: isDoctor,
                          child: Column(
                            children: [
                              DropdownButtonFormField<String>(
                                value: selectedCategory,
                                hint: Text("Select Category"),
                                items: categories.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCategory = value;
                                    controller.categoryController.text = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: "Category",
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                              10.heightBox,
                              CustomTextfield(
                                hint: "About",
                                textController: controller.aboutController,
                              ),
                              10.heightBox,
                              CustomTextfield(
                                hint: "Services",
                                textController: controller.servicesController,
                              ),
                              10.heightBox,
                              CustomTextfield(
                                hint: "Address",
                                textController: controller.addressController,
                              ),
                              10.heightBox,
                              CustomTextfield(
                                hint: "Phone Number",
                                textController: controller.phoneController,
                              ),
                              10.heightBox,
                              GestureDetector(
                                onTap: () => _selectTime(context, controller.timingController), // Open time picker for start time
                                child: AbsorbPointer(
                                  child: CustomTextfield(
                                    hint: "Start Timing",
                                    textController: controller.timingController,
                                  ),
                                ),
                              ),
                              10.heightBox,
                              GestureDetector(
                                onTap: () => _selectTime(context, controller.endTimingController), // Open time picker for end time
                                child: AbsorbPointer(
                                  child: CustomTextfield(
                                    hint: "End Timing",
                                    textController: controller.endTimingController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.heightBox,

                        20.heightBox,
                        CustomButtom(
                          onTap: () async {
                            // Validation for empty fields
                            if (controller.fullnameController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter your full name",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (controller.emailController.text.isEmpty) {
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
                            } else if (isDoctor && controller.categoryController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please select a category for your practice",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (controller.phoneController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please enter your phone number",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else {
                              await controller.signupUser(isDoctor);
                              if (controller.userCredential != null) {
                                Get.offAll(() => Home());
                              }
                            }
                          },
                          buttonText: AppStrings.signup,
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStrings.alreadyHaveAccount.text.make(),
                            5.widthBox,
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: AppStrings.login.text.bold
                                    .color(Colors.blue)
                                    .make()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
