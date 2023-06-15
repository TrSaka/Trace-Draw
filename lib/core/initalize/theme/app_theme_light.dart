import 'package:flutter/material.dart';

mixin AppThemeLight implements ThemeData {
  static ThemeData theme = ThemeData(
    //add sizes
    primaryColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColorLight: const Color(0xFFe7f3f3),
  );
}
