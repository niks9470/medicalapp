import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/images.dart';
import 'package:mediapp/consts/lists.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/controllers/homeController.dart';
import 'package:mediapp/resources/components/custom_textfield.dart';
import 'package:mediapp/views/All_Doctor_view.dart';
import 'package:mediapp/views/categories_views/category_details_views.dart';
import 'package:mediapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:mediapp/views/search_view/search_view.dart';
import 'package:velocity_x/velocity_x.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Welcome users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              height: 70,
              color: AppColors.blueColors,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      TextColor: AppColors.whiteColors,
                      inputColor: AppColors.whiteColors,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.to(()=>SearchView(searchQuery: controller.searchQueryController.text,));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.blue,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
            1.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )),10.heightBox,
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(()=>CategoryDetailsViews(catName: iconsTitleList[index]));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.only(right: 7),
                              height: 44,
                              width: 55,
                              child: Column(
                                children: [
                                  Image.asset(
                                    iconsList[index],
                                    width: 50,
                                  ),
                                  5.heightBox,
                                  AppStyles.normal(title: iconsTitleList[index])
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular Doctors",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var data=snapshot.data?.docs;
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: data?.length??0,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => DoctorProfileView(doc: data[index],));
                                    },
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      margin: EdgeInsets.only(right: 8),
                                      height: 120,
                                      width: 130,
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 130,
                                              alignment: Alignment.center,
                                              color: Colors.blue,
                                              child: Image.asset(
                                                AppAssets.doc1,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              )),
                                          5.heightBox,
                                          AppStyles.normal(
                                              title: data![index]['docName']),
                                          5.heightBox,
                                          AppStyles.normal(
                                              title: data![index]['docCategory'].toString().toLowerCase(),
                                              color: Colors.black54)
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }),
                  5.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>AllDoctorView());

                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.normal(
                          title: "View all", color: Colors.blue, size: 14),
                    ),
                  ),
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tests",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          4,
                          (index) => Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AppAssets.icEar,
                                      width: 25,
                                    ),
                                    5.heightBox,
                                    AppStyles.normal(title: "Lab tests")
                                  ],
                                ),
                              )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
