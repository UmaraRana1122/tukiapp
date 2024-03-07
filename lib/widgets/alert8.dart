import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';

void alertPOP8(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        child: content8(),
      );
    },
  );

  // Close the dialog after 4 seconds
  Future.delayed(Duration(seconds: 4), () {
    Navigator.of(context).pop();
  });
}

Widget content8() {
  return StatefulBuilder(builder: (BuildContext context, setState) {
    return Container(
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Image.asset(
                "assest/images/cancel.png",
                height: 15.h,
              ),
              Text(
                "Account Dismissed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
