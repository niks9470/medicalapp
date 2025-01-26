import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/homeController.dart';
import 'doctor_profile_view/doctor_profile_view.dart';

class AllDoctorView extends StatelessWidget {
  const AllDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "All Doctors",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getDoctorList(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;

            if (data == null || data.isEmpty) {
              return Center(
                child: Text(
                  "No doctors available",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                var doctor = data[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DoctorProfileView(doc: doctor));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/doctor.png'),
                      ),
                      title: Text(
                        doctor['docName'] ?? "Unknown",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        doctor['docCategory']?.toString().toLowerCase() ??
                            "Category unavailable",
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
