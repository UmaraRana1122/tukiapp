import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';

class YourInvitation extends StatelessWidget {
  const YourInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invitation Details",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Invitations",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
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
                        Text(
                          "Invited By:",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assest/images/ownerName.png",
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nelson Aston",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  "nelson@gmail.com",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Your Ticket",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 1.h,
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
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Invitations",
                      style: bodyNormal.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
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
                        Text(
                          "Invited By:",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assest/images/ownerName.png",
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nelson Aston",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  "nelson@gmail.com",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Your Ticket",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 1.h,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Invitations",
                      style: bodyNormal.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
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
                        Text(
                          "Invited By:",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assest/images/ownerName.png",
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nelson Aston",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  "nelson@gmail.com",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Your Ticket",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 1.h,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
