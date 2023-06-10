import 'package:flutter/material.dart';

class ResponsiveFuncs {
  static getHeight(context,value) {
    return MediaQuery.of(context).size.height*value;
  }

  static getWidth(context,double value) {
    return MediaQuery.of(context).size.width * value;
  }
}
