import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/images.dart';
import 'package:mediapp/consts/lists.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/controllers/settings_controller.dart';
import 'package:mediapp/views/login_view/login_views.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() =>
          controller.isLoading.value?Center(
            child: CircularProgressIndicator(),):
         Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.asset(
                  AppAssets.doc1,
                  fit: BoxFit.contain,
                ),
              ),
              title: AppStyles.normal(title: controller.username.value,size: 20),
              subtitle: AppStyles.normal(title:controller.email.value),
            ),
            const Divider(),
            20.heightBox,
            ListView(
                shrinkWrap: true,
                children: List.generate(
                    settingsList.length,
                        (index) =>
                        ListTile(
                            onTap: () {
                              if (index == 4) {
                                AuthController().signout();
                                Get.offAll(() => LoginViews());
                              }
                            },
                            leading: Icon(
                              settingsListIcons[index],
                              color: Colors.blue,
                            ),
                            title: AppStyles.normal(
                                title: settingsList[index], size: 15))))
          ],
        ),
      ),
    );
  }
}
