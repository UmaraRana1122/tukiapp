import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/alert_page.dart';

class SettingsHelp extends StatefulWidget {
  const SettingsHelp({super.key});

  @override
  State<SettingsHelp> createState() => _SettingsHelpState();
}

class _SettingsHelpState extends State<SettingsHelp> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      alertPOP(context);
    });
  }

  bool isUserAuthorized = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings / Help & Support",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ), // You can use any other icon you prefer
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(color: Color(0xffFAFAFA)),
              child: Row(
                children: [
                  Image.asset(
                    "assest/images/111.png",
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Call Us",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "0000 000000 0000",
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(color: Color(0xffFAFAFA)),
              child: Row(
                children: [
                  Image.asset(
                    "assest/images/112.png",
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "communityadmin@gmail.com",
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(color: Color(0xffFAFAFA)),
              child: Row(
                children: [
                  Image.asset(
                    "assest/images/113.png",
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Quick Contact",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
