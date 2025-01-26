import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/lists.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/views/categories_views/category_details_views.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: AppStyles.normal(title: AppStrings.Category,size: 22,color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 170

          ),itemCount: iconsList.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                Get.to(()=>CategoryDetailsViews(catName:iconsTitleList[index] ,));

              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blueColors,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.center,
                        child: Image.asset(iconsList[index],width: 50,)),
                    const Divider(thickness: 1,color: Colors.white,),
                    10.heightBox,
                  AppStyles.normal(
                      title: iconsTitleList[index],size: 16,color: Colors.white),
                    10.heightBox,
                    AppStyles.normal(
                        title: "13 specialists",size: 16,color: Colors.white
                    )
                  ],
                ),

              ),
            );
          },


        ),
      )

        
      );
  }
}
