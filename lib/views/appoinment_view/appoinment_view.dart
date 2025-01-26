import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/images.dart';
import 'package:mediapp/controllers/appointmentController.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/views/appoinment_view/appoinment_details_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';

class AppoinmentView extends StatelessWidget {
  final bool isDoctor;
  const AppoinmentView({super.key, this.isDoctor=false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueColors,
          title: Text(
            "Appointments",
            style: TextStyle(color: Colors.white, fontSize: 18),

          ),
          actions: [
           IconButton(onPressed: (){
             AuthController().signout();
           }, icon: Icon(Icons.power_settings_new_rounded))
        ],
        ),
        body:
        FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(isDoctor),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: data?.length??0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          // tileColor: Colors.grey,
                          onTap: () {
                            Get.to(() => AppoinmentDetailsView(doc: data[index],));
                          },
                          leading: CircleAvatar(
                            child: Image.asset(AppAssets.doc1),
                          ),
                          title: AppStyles.normal(title:data![index][!isDoctor?'appWithName':'appName'],size: 20),
                          subtitle: AppStyles.normal(
                              title:
                                  "${data[index]['appDay']}-${data[index]['appTime']}",
                              color: AppColors.textColor.withOpacity(0.9),size: 15),
                        );
                      },
                      ),
                );
              }
            }));
  }
}
