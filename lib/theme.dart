import 'package:flutter/material.dart';
import 'utils.dart';

ThemeData islamiTheme = ThemeData(

  fontFamily: 'f1',
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: mainColor,
    indicatorColor: secColor.withValues(alpha: 0.6),
    iconTheme: WidgetStatePropertyAll(IconThemeData(color: textColor)),
    labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xB2202020),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: mainColor,width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: mainColor,width: 1),
    ),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: mainColor
  )
);
