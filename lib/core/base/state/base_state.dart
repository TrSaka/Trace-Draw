import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  getHeightOfDevice(value) {
    return MediaQuery.of(context).size.height * value;
  }

  getWidthOfDevice(int value) {
    return MediaQuery.of(context).size.height * value;
  }

  ThemeData getTheme() {
    return Theme.of(context);
  }
}
