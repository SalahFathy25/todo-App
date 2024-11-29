import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white, // AppBar text and icons color
    elevation: 0,
  ),
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
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.grey, // Background color of buttons
    textTheme: ButtonTextTheme.primary, // Text color of buttons
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Icon color
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 28, 28, 28), // Input field background color
    hintStyle: TextStyle(color: Color.fromARGB(255, 97, 97, 97)), // Hint text color
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey), // Border color
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.grey, // FAB background color
    foregroundColor: Colors.white, // FAB icon color
  ),
  cardColor: const Color.fromARGB(255, 28, 28, 28), // Card background color
  dividerColor: Colors.grey,
);
