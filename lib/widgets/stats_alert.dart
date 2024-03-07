import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:sizer/sizer.dart';

void alertPOP9(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        child: content9(context),
      );
    },
  );
}

Widget content9(BuildContext context) {
  return StatefulBuilder(builder: (BuildContext context, setState) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stats",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Text(
                      "Progress in Percentage",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "60/100",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                LinearProgressBar(
                  maxSteps: 100,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: 60,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey,
                  minHeight: 10,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Occupation: 60%",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color(0xffd1f0ff),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Total Validated Attendees",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 12.w), // Add some spacing
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabled: true,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '60/100',
                              hintStyle: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Color(0xff4B5768),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color(0xffd1f0ff),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Checked In Attendees",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        // Add some spacing
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabled: true,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '    60',
                              hintStyle: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Color(0xff4B5768),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color(0xffd1f0ff),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Checked Out Attendees",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
// Add some spacing
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabled: true,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '    00',
                              hintStyle: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Color(0xff4B5768),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color(0xffd1f0ff),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Cancel Attendees",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabled: true,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: '    00',
                              hintStyle: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Color(0xff4B5768),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}

void _showAlertSent(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pop(true); // Close the alert dialog
      });
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/done.png",
              height: 10.h,
            ),
            SizedBox(height: 1.h),
            Text(
              "Alert Sent",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Alert sent successfully to the whole community owners, co owners, tenants and co tenant.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    },
  );
}
