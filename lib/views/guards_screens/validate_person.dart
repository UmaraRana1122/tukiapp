import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import 'validate_person_details.dart';

class ValidatePerson extends StatefulWidget {
  const ValidatePerson({Key? key}) : super(key: key);

  @override
  State<ValidatePerson> createState() => _ValidatePersonState();
}

class _ValidatePersonState extends State<ValidatePerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Validate People",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Validate People List",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 18.h,
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assest/images/ownerName.png",
                                      height: 7.h,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          page: const ValidatePersonDetails());
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      const PopupMenuItem<String>(
                                        value: 'Option 1',
                                        child: Text('View Details'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Option 2',
                                        child: Text('Eliminate Account'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Option 3',
                                        child: Text('Send Warning'),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Building Name',
                                  style: bodyNormal,
                                ),
                                Text(
                                  'building name here',
                                  style:
                                      bodyNormal.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Purpose of Coming',
                                  style: bodyNormal,
                                ),
                                Text(
                                  'house maid',
                                  style:
                                      bodyNormal.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
