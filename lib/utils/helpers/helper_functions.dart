import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../constants/sizes.dart';

class HelperFunctions {
  HelperFunctions._();

//!----> get color
  static Color? getColor(String color) {
    String capColor = color.toLowerCase();
    if (capColor == "green") {
      return Colors.green;
    } else if (capColor == "blue") {
      return Colors.blue;
    } else if (capColor == "red") {
      return Colors.red;
    } else if (capColor == "black") {
      return Colors.black;
    } else if (capColor == "white") {
      return Colors.white;
    } else if (capColor == "yellow") {
      return Colors.yellow;
    } else if (capColor == "orange") {
      return Colors.orange;
    } else if (capColor == "pink") {
      return Colors.pink;
    } else if (capColor == "brown") {
      return Colors.brown;
    } else if (capColor == "teal") {
      return Colors.teal;
    } else if (capColor == "grey") {
      return Colors.grey;
    } else if (capColor == "purple") {
      return Colors.purple;
    } else if (capColor == "cyan") {
      return Colors.cyan;
    } else if (capColor == "indigo") {
      return Colors.indigo;
    } else if (capColor == "lime") {
      return Colors.lime;
    } else if (capColor == "silver") {
      return const Color.fromARGB(255, 165, 169, 180);
    } else if (capColor == "gold") {
      return const Color.fromARGB(255, 222, 207, 8);
    } else {
      return null;
    }
  }

//! ---> show snack Bar
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  //! ---> get Bottom Navigation Bar Height
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  //! -----> set status bar brigtness
  static void setStatusBarBrightness(BuildContext context, [bool revirse = false]) {
    bool isDark = revirse ? !isDarkMode(context) : isDarkMode(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ));
  }

//! ---> generate uid
  static String generateId() {
    var uuid = const Uuid();
    String id = uuid.v4();
    return id;
  }

//! ---> show alert
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("OK"))],
      ),
    );
  }

//! ---> navigate to screen
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static EdgeInsets screenBoarderSpace() {
    return const EdgeInsets.all(AppSizes.defaultSpace);
  }

//! ---> truncate Text
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return "${text.substring(0, maxLength)}...";
    }
  }

//! ---> is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

//! ---> get screen size
  static Size getScreenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

//! ---> get screen width
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

//! ---> get formated date
  static String getFormattedDate(DateTime date, {String format = "dd MMM yyy"}) {
    return DateFormat(format).format(date);
  }

//! ---> remove dublicates
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }
}
