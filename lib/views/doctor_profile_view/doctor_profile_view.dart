import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/images.dart';
import 'package:mediapp/resources/components/custom_buttom.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/appointmentController.dart';
import '../book_appointment_view/book_appointment_view.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColors,
        title: Text("Doctor Details",style: TextStyle(color: Colors.white,fontSize: 18),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
          
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue
                      ),
                      //radius: 40,
                      child: Image.asset(AppAssets.doc1,fit: BoxFit.fill,),),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['docName'],style: TextStyle(color: Colors.black,fontSize: 14),),
                          Text(doc["docCategory"],style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 12),),
                          Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            maxRating: 5,
                            normalColor:Colors.grey,
                            onRatingUpdate: (value){},
                          count: 5,
                            value: double.parse(doc["docRating"].toString()),
                            stepInt: true,)
                        ],
                      ),
                    ),
                    Text("See all Review",
                      style: TextStyle(color: Colors.blue,fontSize: 12),),

                  ],
                ),
          
          
          ),
              10.heightBox,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColors,
                  
                ),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: AppStyles.normal(title: "Phone Number",color: AppColors.textColor,size: 18),
                    subtitle: AppStyles.normal(title: "+91"+" "+doc["docPhone"],color: AppColors.textColor.withOpacity(0.5),size: 14),
                    trailing: Container(
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:AppColors.yellowColor
                      ),child: Icon(Icons.phone,color: AppColors.whiteColors,),
                    ),
                  ),
                  10.heightBox,
                  AppStyles.normal(title: "About",color: AppColors.textColor,size: 18),
                 // 1.heightBox,
                  AppStyles.normal(title: doc["docAbout"],color: Colors.black.withOpacity(0.5),size: 14),
                10.heightBox,
                  AppStyles.normal(title: "Address",color: AppColors.textColor,size: 18),
                 // 10.heightBox,
                  AppStyles.normal(title: doc["docAddress"],color: Colors.black.withOpacity(0.5),size: 13),
                10.heightBox,
                  AppStyles.normal(title: "Working Time",color: AppColors.textColor,size: 18),
                  //10.heightBox,
                  AppStyles.normal(
                    title: "${doc["docTiming"]} - ${doc["docEndTiming"]}",
                    color: Colors.black.withOpacity(0.5),
                    size: 13),
                    10.heightBox,
                  AppStyles.normal(title: "Services",color: AppColors.textColor,size: 18),
                 // 5.heightBox,
                  AppStyles.normal(title:doc["docServices"] ,color: Colors.black.withOpacity(0.5),size: 13),

                ],
                            ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButtom(onTap: (){
          Get.to(()=>AppointmentView(docId: doc['docId'],docName: doc['docName'],));

        }, buttonText: "Book an appointment"),
      ),
    );
  }
}
