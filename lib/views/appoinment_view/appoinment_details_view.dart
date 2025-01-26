import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/fonts.dart';
import '../../consts/strings.dart';
import '../../resources/components/custom_textfield.dart';

class AppoinmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppoinmentDetailsView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: AppStyles.normal(title:doc['appWithName'],size: 14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            AppStyles.normal(title: "select Appointment day",size: 16),
            5.heightBox,
            AppStyles.normal(title: doc['appDay'],size: 14),
            20.heightBox,
            AppStyles.normal(title: "select Appointment time",size: 16),
            5.heightBox,
            AppStyles.normal(title: doc['appTime'],size: 14),
            20.heightBox,
            AppStyles.normal(title: "Mobile number",size: 16),
            5.heightBox,
            AppStyles.normal(title: doc['appMobile'],size: 14),
             20.heightBox,
            AppStyles.normal(title: "Full name",size: 16),
            5.heightBox,
            AppStyles.normal(title: doc['appName'],size: 14),
            20.heightBox,
            AppStyles.normal(title: "Message",size: 16),
            5.heightBox,
            AppStyles.normal(title: doc['appMessage'],size: 14),




          ],
        ),
      ),
    );
  }
}
