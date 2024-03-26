import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

void alertPOp(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          child: contnt());
    },
  );
}

Widget contnt() {
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
                "Create a New Password",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
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
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                        color: Color(0xff4B5768),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300)),
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
                    hintText: 'Confirm Password',
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
                  Get.dialog(
                    Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.white,
                      child: contnt2(),
                    ),
                  );
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
                    "Save",
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

Widget contnt2() {
  return Container(
    height: 30.h,
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 50,
        ),
        SizedBox(height: 2.h),
        Text(
          "Password Updated Successfully",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          textAlign: TextAlign.center,
          "Your password has been updated successfully, don't share with anyone",
          style: TextStyle(
            color: Color(0xff404040),
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text(
            "Close",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
