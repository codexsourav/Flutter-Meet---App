import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color kappcolor = Color.fromARGB(255, 108, 99, 255);
Color? kAppDarkbgcolor = const Color.fromARGB(255, 3, 3, 3);

Color? kdarkTextColor = const Color.fromARGB(255, 248, 248, 248);

Color? klightbgColor = Colors.white;
Color? kdlightTextColor = const Color.fromARGB(255, 2, 2, 2);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: klightbgColor,
  fontFamily: "Lato",
  useMaterial3: true,
  primaryColor: ThemeData.light(useMaterial3: true).scaffoldBackgroundColor,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    centerTitle: false,
    backgroundColor: klightbgColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(color: Colors.black),
    systemOverlayStyle: const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Navigation bar
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: klightbgColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0.0,
    enableFeedback: false,
    selectedItemColor: kdlightTextColor,
    unselectedItemColor: const Color.fromARGB(87, 0, 0, 0),
    unselectedIconTheme: const IconThemeData(
      color: Color.fromARGB(87, 0, 0, 0),
      size: 22,
    ),
    selectedIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 3, 3, 3),
      size: 21,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    fillColor: Color.fromARGB(255, 134, 134, 134).withOpacity(0.07),
    filled: true,
    iconColor: Color.fromARGB(255, 108, 99, 255),
    prefixIconColor: Color.fromARGB(255, 108, 99, 255),
    suffixIconColor: Color.fromARGB(255, 108, 99, 255),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.white)),
      elevation: const MaterialStatePropertyAll(0.0),
      iconColor: const MaterialStatePropertyAll(Colors.white),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor:
          const MaterialStatePropertyAll(Color.fromARGB(255, 108, 99, 255)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
      ),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: klightbgColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStatePropertyAll(Colors.transparent),
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      foregroundColor: MaterialStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      elevation: MaterialStatePropertyAll(0.0),
      iconColor: MaterialStatePropertyAll(Colors.black),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 22,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: klightbgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.white,
    selectionHandleColor: Colors.black,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      textStyle: const MaterialStatePropertyAll(
          TextStyle(color: Color.fromARGB(255, 108, 99, 255))),
      elevation: const MaterialStatePropertyAll(0.0),
      iconColor: const MaterialStatePropertyAll(Colors.white),
      foregroundColor:
          const MaterialStatePropertyAll(Color.fromARGB(255, 108, 99, 255)),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color.fromARGB(255, 108, 99, 255)),
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
      ),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStatePropertyAll(Colors.transparent),
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      foregroundColor:
          MaterialStatePropertyAll(Color.fromARGB(255, 108, 99, 255)),
      splashFactory: NoSplash.splashFactory,
      elevation: MaterialStatePropertyAll(0.0),
      iconColor: MaterialStatePropertyAll(Color.fromARGB(255, 108, 99, 255)),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: klightbgColor,
    textColor: Colors.black,
    iconColor: Colors.black,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
    subtitleTextStyle:
        TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: kdlightTextColor,
      fontWeight: FontWeight.w400,
    ),
  ),
).copyWith(
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  focusColor: Colors.transparent,
  highlightColor: Colors.transparent,
);
