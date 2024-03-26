import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

void alertPOP7(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        child: content7(),
      );
    },
  );

  // Close the dialog after 4 seconds
  Future.delayed(Duration(seconds: 4), () {
    Navigator.of(context).pop();
  });
}

Widget content7() {
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
                "assest/images/warning.png",
                height: 15.h,
              ),
              Text(
                "Warning Sent Successfully",
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
