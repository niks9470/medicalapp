// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import '../../consts/colors.dart';
// import '../../consts/fonts.dart';
// import '../../consts/images.dart';
// import '../doctor_profile_view/doctor_profile_view.dart';
//
// class SearchView extends StatelessWidget {
//   final String searchQuery;
//   const SearchView({super.key, required this.searchQuery});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Search Results",
//           style: TextStyle(color: Colors.blue),
//         ),
//       ),
//       body:
//       FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore.instance.collection('doctors').get(),
//          // future: FirebaseFirestore.instance.collection("doctors").
//       // where("docCategory",
//       //     isEqualTo:catName ).get(),
//           builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
//             if(!snapshot.hasData){
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }else{
//               return   Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GridView.builder(
//                     itemCount:snapshot.data!.docs.length,
//                     shrinkWrap: true,
//                     gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisExtent: 170,
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 12
//
//                     ),
//                     itemBuilder: (BuildContext context,int index){
//                       var doc=snapshot.data!.docs[index];
//                       return !doc["docCategory"].toString().toLowerCase().contains(searchQuery)?
//                           const SizedBox.shrink():
//
//                        GestureDetector(
//                          onTap: (){
//                            Get.to(()=>DoctorProfileView(doc: doc));
//                          },
//                          child: Container(
//                            clipBehavior: Clip.hardEdge,
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(12),
//
//
//                           ),
//                           margin: EdgeInsets.only(right: 4,left: 4),
//                           height: 120,width: 130,
//                           child:Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 // width: 130,
//                                   alignment: Alignment.center,
//                                   color: Colors.blue,
//
//                                   child: Image.asset(
//                                     AppAssets.doc1,width: 120,fit: BoxFit.cover,)),
//                               5.heightBox,
//                               AppStyles.normal(title: doc['docName']),
//                               5.heightBox,
//                               VxRating(
//                                 selectionColor: AppColors.yellowColor,
//                                 maxRating: 5,
//                                 normalColor:Colors.grey,
//                                 onRatingUpdate: (value){},
//                                 count: 5,
//                                 value: double.parse(doc['docRating'].toString()),
//                                 stepInt: true,)
//
//
//
//                             ],
//                           ) ,
//                          )
//
//                        );
//                     }),
//               );
//             }
//           }),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';
import '../../consts/images.dart';
import '../doctor_profile_view/doctor_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Results",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var filteredDocs = snapshot.data!.docs
                .where((doc) =>
                doc['docCategory']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
                .toList();

            if (filteredDocs.isEmpty) {
              return const Center(
                child: Text(
                  "No results found.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: filteredDocs.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  mainAxisExtent: 220, // Height of each grid item
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 12, // Spacing between rows
                ),
                itemBuilder: (BuildContext context, int index) {
                  var doc = filteredDocs[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DoctorProfileView(doc: doc));
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120, // Fixed height for image
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage(AppAssets.doc1),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppStyles.normal(
                                  title: doc['docName'] ?? "Unknown",
                                  size: 14,
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 5),
                                AppStyles.normal(
                                  title: doc['docCategory']
                                      ?.toString()
                                      .toLowerCase() ??
                                      "Category unavailable",
                                  size: 12,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 5),
                                VxRating(
                                  selectionColor: AppColors.yellowColor,
                                  maxRating: 5,
                                  normalColor: Colors.grey,
                                  onRatingUpdate: (value) {},
                                  count: 5,
                                  value: double.parse(
                                      doc['docRating'].toString()),
                                  stepInt: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
