import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppStyles{
  static normal({ required String title,
    Color?color= Colors.black,
    double? size=11,
    TextAlign? alignment=TextAlign.left}){
    return title.text.size(size).color(color).make();
  }
  // static   bold({String? title,Color?color= Colors.black,double? size}){
  //   title!.text.size(size).color(color).fontFamily().make();
  // }
}