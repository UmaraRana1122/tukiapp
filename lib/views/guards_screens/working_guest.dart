import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/co_owner_details.dart';
import 'package:tukiapp/views/admin_screens/owner_details.dart';
import 'package:tukiapp/views/admin_screens/tenant_details.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';

class GuestDetails extends StatefulWidget {
  const GuestDetails({Key? key}) : super(key: key);

  @override
  State<GuestDetails> createState() => _GuestDetailsState();
}

class _GuestDetailsState extends State<GuestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Working Guest Details",
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal Details",
              style: bodyNormal.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 1.h,
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "First Name:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Nelson",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Last Name:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Villa",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email Address:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "nelson@gmail.com",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact No:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "+00 000 0000",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Other Details",
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date From:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "20-09-2024",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date To:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "20-09-2024",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time From:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "04:00PM",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time To:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "06:00PM",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Purpose of Coming::",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "House Maid",
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
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 5.h,
              width: 30.w,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              child: Align(
                child: Text(
                  "Detach Details",
                  style: bodyNormal.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 9.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// InkWell(
//                             onTap: () {
//                               PageTransition.pageNavigation(
//                                   page: EventListing(
//                                 eventData: _adminController.adminDashBoard,
//                               ));
//                             },
//                             child: Container(
//                               height: 3.h,
//                               width: 20.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(5.0),
//                               ),
//                               child: Center(
//                                   child: Text(
//                                 "View All",
//                                 style: bodyNormal,
//                               )),
//                             ),
//                           )