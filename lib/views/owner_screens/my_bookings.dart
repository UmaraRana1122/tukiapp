import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';
import 'package:tukiapp/views/guards_screens/tennis_detail.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';

import '../../generated/assets.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookings",
          style: bodyNormal,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 2.h,
            )),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Color(0xfff0f9ff),
                    borderRadius: BorderRadius.circular(8)),
                child: TabBar(
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Container(
                        height: 4.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? Colors.blue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Tab(
                          text: "Current",
                        ),
                      ),
                      Container(
                        height: 4.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Tab(
                          text: "Expired",
                        ),
                      ),
                    ]),
              ),
              if (currentIndex == 0)
                Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      hintText: 'Search id',
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Assets.imagesFilter,
                            height: 16,
                          )),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "ID#111111332",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Sample Restaurant will come here",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "10pm to 12am",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "From(11:00 PM)  To (12:00 AM)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Exp Date : 14-12-2023",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assest/images/barcode.png",
                              height: 13.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "ID#111111332",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Sample Restaurant will come here",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "10pm to 12am",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "From(11:00 PM)  To (12:00 AM)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Exp Date : 14-12-2023",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assest/images/barcode.png",
                              height: 13.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "ID#111111332",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Sample Restaurant will come here",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "10pm to 12am",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "From(11:00 PM)  To (12:00 AM)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Exp Date : 14-12-2023",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assest/images/barcode.png",
                              height: 13.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (currentIndex == 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Tennis Court",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp),
                                  ),
                                  Text(
                                    "(\$200)",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11.sp),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz_rounded,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Center(
                                child: Image.asset(
                                  "assest/images/club.png",
                                  width: 80.w,
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Guards:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "2 Allocated",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(TenisDetail());
                                    },
                                    child: Text(
                                      "View Details",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontSize: 11.sp),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Guest Ticket Details",
                        style: bodyNormal.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F9FF),
                          border: Border.all(
                            color: const Color(0xffc6c6ff), // Border width
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Tennis Court",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "From(12-12-2023)  To(12-12-2023)",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Mon:",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "From(11:00 PM)  To (12:00 AM)",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Exp Date : 14-12-2023",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        "assest/images/barcode.png",
                                        height: 13.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "First Name:",
                                          style: bodyNormal.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "Nelson",
                                          style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "National Id No:",
                                          style: bodyNormal.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "1111111111111",
                                          style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Email Address:",
                                          style: bodyNormal.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "nelson@gmail.com",
                                          style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Contact No:",
                                          style: bodyNormal.copyWith(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "+00 000 0000",
                                          style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
