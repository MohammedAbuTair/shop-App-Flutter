import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/colors.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: defaultColors,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: HexColor('333739'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColors,
        backgroundColor: HexColor('333739'),
        unselectedItemColor: Colors.grey,
        elevation: 1),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: defaultColors),
    fontFamily: 'Macondo');

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: defaultColors,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColors,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 1),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: defaultColors),
    fontFamily: 'Macondo');
