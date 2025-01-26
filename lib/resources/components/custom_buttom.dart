import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';

class CustomButtom extends StatelessWidget {
  final Function ()?onTap;
  final String buttonText;
  const CustomButtom({super.key,required this.onTap,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: context.screenWidth,height: 44,child:
    ElevatedButton(
    style:ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    textStyle: TextStyle(fontSize: 20),
    shape: const StadiumBorder()
    ),
      onPressed: onTap,
      child: buttonText.text.make(),
    ),
    );
  }
}
