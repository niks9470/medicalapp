import 'package:flutter/material.dart';
import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
import 'package:mediapp/views/categories_views/category_view.dart';
import 'package:mediapp/views/home_view/homeview.dart';
import 'package:mediapp/views/settings_view/settings_view.dart';
import '../login_view/login_views.dart';

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  int selectedIndex=0;
  List screensList=[
    const Homeview(),
    const AppoinmentView(),
    const CategoryView(),
    // const LoginViews(),
    const SettingsView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.blue,
        type:BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex=value;
          });
          },
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book,),label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
      //  BottomNavigationBarItem(icon: Icon(Icons.person),label: "Doctor"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")


      ],),
    );
  }
}
