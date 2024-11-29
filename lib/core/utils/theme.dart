import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  focusColor: Colors.black ,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 21,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 234, 234, 234),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: Colors.grey,
      fontSize: 17,
    ),
    headlineSmall: TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 40,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  focusColor: Colors.white ,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 97, 97, 97),
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 21,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 21, 21, 21),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 97, 97, 97),
      fontSize: 17,
    ),
    headlineSmall: TextStyle(
      color: Color.fromARGB(255, 97, 97, 97),
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
  ),
);
