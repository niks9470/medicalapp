import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:mediapp/views/home_view/homeview.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/images.dart';

class CategoryDetailsViews extends StatelessWidget {
  final String catName;
  const CategoryDetailsViews({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyles.normal(title: catName,color: AppColors.whiteColors,size: 20),
      ),
      body:
      FutureBuilder<QuerySnapshot>(future: FirebaseFirestore.instance.collection("doctors").
      where("docCategory",
          isEqualTo:catName ).get(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),
          );
        }else{
          var data=snapshot.data?.docs;
          return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: data?.length??0,
                shrinkWrap: true,
                gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 12

                ),
                itemBuilder: (BuildContext context,int index){
                  return Container(

                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),


                    ),
                    margin: EdgeInsets.only(right: 4,left: 4),
                    height: 120,width: 130,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: 130,
                            alignment: Alignment.center,
                            color: Colors.blue,

                            child: Image.asset(
                              AppAssets.doc1,width: 120,fit: BoxFit.cover,)),
                        5.heightBox,
                        AppStyles.normal(title: data![index]['docName']),
                        5.heightBox,
                        VxRating(
                          selectionColor: AppColors.yellowColor,
                          maxRating: 5,
                          normalColor:Colors.grey,
                          onRatingUpdate: (value){},
                          count: 5,
                          value: double.parse(data[index]['docRating'].toString()),
                          stepInt: true,)



                      ],
                    ) ,
                  ).onTap((){
                    Get.to(()=>DoctorProfileView(doc: data[index]));
                  });
                }),
          );
        }
          })
    
      
    );
  }
}

