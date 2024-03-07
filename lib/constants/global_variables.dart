import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

// UserModel? userData;
RxString fcmToken = ''.obs;

///---------App Colors

class AppColors {
  static const Color buttonColor = Color(0xff00A3FF);
  static const Color goldColor = Color(0xffE3BD66);
  static const Color hintColor = Color(0xff404040);
  static const Color primaryColor = Color(0xff033d94);
  static const Color scaffoldColor = Colors.white;
  static const Color secondaryColor = Color(0xffeceaef);
  static const Color textFieldColor = Color(0xffE3BD66);
}

///---------App Texts
TextStyle headingLarge = const TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700);

TextStyle headingMedium = const TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle headingSmall = const TextStyle(
  fontSize: 17,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodyLarge = const TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodyNormal = const TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodySmall = const TextStyle(
    fontSize: 10, color: Colors.black, fontFamily: 'Poppins', height: 1.5);

TextStyle title = const TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle hintText = const TextStyle(
  fontSize: 12,
  color: Colors.black12,
  fontFamily: 'Poppins',
);

void setUserFirstTime(bool key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isFirstTime", key);
}

Future getUserFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("isFirstTime") ?? true;
  return log;
}

void setUserLoggedIn(bool key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", key);
}

Future getUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("isLoggedIn") ?? false;
  return log;
}

void saveUserData({@required email, @required pass}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("email", email);
  await pref.setString("pass", pass);
}

Future getUserDataEmail() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? result = pref.getString("email");
  return result;
}

Future getUserDataPass() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? result = pref.getString("pass");
  return result;
}
