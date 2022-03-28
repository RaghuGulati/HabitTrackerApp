import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12.0),
            primary: Colors.yellow[300],
            minimumSize: const Size(500, 50),
          ),
        ),
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 40, color: Colors.black )),
      );

ThemeData dashboardTheme = ThemeData(
        primarySwatch: Colors.red  ,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
           minimumSize: const Size(550,50),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12.0),
            primary: Colors.orange,
            minimumSize: const Size(500, 50),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30, color: Colors.black),
          bodyText1: TextStyle(fontSize: 30, color: Colors.white),
          
          ),
        //textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30, color: Colors.white )),
      );

ThemeData loginTheme = ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12.0),
            primary: Colors.yellow,
            minimumSize: const Size(500, 50),
          ),
        ),
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 25, color: Colors.black )),
      );