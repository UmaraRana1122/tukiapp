import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../constants/global_variables.dart';

class ValidatePersonDetails extends StatefulWidget {
  const ValidatePersonDetails({Key? key}) : super(key: key);

  @override
  State<ValidatePersonDetails> createState() => _ValidatePersonDetailsState();
}

class _ValidatePersonDetailsState extends State<ValidatePersonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Validate People Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ), // You can use any other icon you prefer
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F9FF),
                    border: Border.all(
                      color: Color(0xffC7C6C6FF), // Border width
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Owner details",
                          style:
                              bodyNormal.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Building Name:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "building Name here",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date of  Birth:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "02/11/2000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "National Id:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "1111111111",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "+3086756445",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F9FF),
                    border: Border.all(
                      color: Color(0xffC7C6C6FF), // Border width
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal details",
                          style:
                              bodyNormal.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Building Name:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "building Name here",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date of  Birth:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "02/11/2000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "National Id:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "1111111111",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "+3086756445",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F9FF),
                    border: Border.all(
                      color: Color(0xffC7C6C6FF), // Border width
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Other details",
                          style:
                              bodyNormal.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Building Name:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "building Name here",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date of  Birth:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "02/11/2000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "National Id:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "1111111111",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "+3086756445",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ZoomTapAnimation(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                  },
                  onLongTap: () {},
                  enableLongTapRepeatEvent: false,
                  longTapRepeatDuration: const Duration(milliseconds: 100),
                  begin: 1.0,
                  end: 0.93,
                  beginDuration: const Duration(milliseconds: 20),
                  endDuration: const Duration(milliseconds: 120),
                  beginCurve: Curves.decelerate,
                  endCurve: Curves.fastOutSlowIn,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: 40.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("Detach Details",
                            style: bodyNormal.copyWith(
                              color: Colors.white,
                            )),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
