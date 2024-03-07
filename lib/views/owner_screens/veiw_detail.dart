import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/owner_details.dart';
import 'package:tukiapp/views/admin_screens/tenant_details.dart';
import '../../constants/custom_navigation.dart';

import '../../constants/global_variables.dart';

class VeiwDetails extends StatefulWidget {
  const VeiwDetails({Key? key}) : super(key: key);

  @override
  State<VeiwDetails> createState() => _VeiwDetailsState();
}

class _VeiwDetailsState extends State<VeiwDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Co Owner Details",
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "View Details",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assest/images/ownerName.png",
                        height: 6.h,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nelson Aston',
                            style: bodyNormal,
                          ),
                          Text(
                            'nelson@gmail.com',
                            style: hintText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    // 3-dots icon
                    onSelected: (value) {
                      // Handle the selected value
                      if (value == "Option 1") {
                        PageTransition.pageNavigation(
                            page: const OwnerDetails());
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'Option 1',
                          child: Text('Eliminate Account'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Send Warning'),
                        ),
                      ];
                    },
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
                    color: const Color(0xffc7c6c6ff), // Border width
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
                        style: bodyNormal.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Licence plate:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "#0000000",
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
                            "Building Name:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "building Name here",
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
                            "Date of  Birth:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "02/11/2000",
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
                            "National Id:",
                            style: bodyNormal.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "1111111111",
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
          ],
        ),
      ),
    );
  }
}
