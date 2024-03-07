import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';

void alertPOP(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          child: content());
    },
  );
}

Widget content() {
  return StatefulBuilder(builder: (BuildContext context, setState) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Text(
                "Enter Your Email",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "We Will sent you a 4 Digit verification OTP code on your email",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: Color(0xff4B5768),
                style: TextStyle(color: Color(0xff4B5768)),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD0D5DD),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff4B5768),
                          width: .1.w,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                        color: Color(0xff4B5768),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Settings());
                },
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Color(0xff00A3FF),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xffd49c9c))),
                  child: Align(
                      child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}
