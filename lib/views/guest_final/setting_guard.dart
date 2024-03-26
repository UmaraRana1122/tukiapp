
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/alert1.dart';
import 'package:tukiapp/widgets/pop1.dart';

class SettingsGuard extends StatefulWidget {
  const SettingsGuard({Key? key});

  @override
  State<SettingsGuard> createState() => _SettingsGuardState();
}

class _SettingsGuardState extends State<SettingsGuard> {
  bool isUserAuthorized = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Show alert dialog when "Change Password" is tapped
                alertPOP1(context);
              },
              child: Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(color: Color(0xffFAFAFA)),
                child: Row(
                  children: [
                    Image.asset(
                      "assest/images/lock.png",
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
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
                    "assest/images/setting.png",
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Push Notifications",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  FlutterSwitch(
                    height: 29,
                    width: 58.0,
                    toggleSize: 35.0,
                    value: isUserAuthorized,
                    borderRadius: 20.0,
                    padding: 2,
                    activeToggleColor: Color(0xff00A3FF),
                    inactiveToggleColor: Colors.transparent,
                    activeSwitchBorder: Border.all(
                      color: Color(0xff00A3FF),
                      width: 2.0,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    activeColor: Color(0xffFFFFff),
                    inactiveColor: Colors.grey,
                    activeIcon: CircleAvatar(
                      backgroundColor: Color(0xff00A3FF),
                    ),
                    inactiveIcon: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    onToggle: (val) {
                      setState(() {
                        isUserAuthorized = val;
                      });
                    },
                  ),
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
                    "assest/images/how.png",
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Help & Support",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        alertPOp(context);
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
