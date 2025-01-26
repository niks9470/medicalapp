

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';
import '../../controllers/appointmentController.dart';
import '../../resources/components/custom_buttom.dart';
import '../../resources/components/custom_textfield.dart';

class AppointmentView extends StatelessWidget {
  final String docId;
  final String docName;

  const AppointmentView({super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        controller.appDayController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      }
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        controller.appTimeController.text = picked.format(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyles.normal(
          title: docName,
          color: AppColors.whiteColors,
          size: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.normal(title: "Select appointment day", size: 16),
              5.heightBox,
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: CustomTextfield(
                    hint: "Select day",
                    textController: controller.appDayController,
                    TextColor: Colors.grey,
                  ),
                ),
              ),
              10.heightBox,
              AppStyles.normal(title: "Select appointment time", size: 16),
              5.heightBox,
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: CustomTextfield(
                    hint: "Select time",
                    textController: controller.appTimeController,
                    TextColor: Colors.grey,
                  ),
                ),
              ),
              20.heightBox,
              AppStyles.normal(title: "Mobile number", size: 16),
              5.heightBox,
              CustomTextfield(
                hint: "Enter your mobile number",
                textController: controller.appMobileController,
                TextColor: Colors.grey,
              ),
              10.heightBox,
              AppStyles.normal(title: "Full Name", size: 16),
              CustomTextfield(
                hint: "Enter your name",
                textController: controller.appNameController,
                TextColor: Colors.grey,
              ),
              10.heightBox,
              AppStyles.normal(title: "Message", size: 16),
              5.heightBox,
              CustomTextfield(
                hint: "Enter your message",
                textController: controller.appMessageController,
                TextColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : CustomButtom(
            onTap: () async {
              await controller.bookAppointment(docId, docName, context);
            },
            buttonText: "Book an appointment",
          ),
        );
      }),
    );
  }
}

