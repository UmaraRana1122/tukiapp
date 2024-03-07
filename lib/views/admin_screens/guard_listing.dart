import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/generated/assets.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widget.dart';
import '../guards_screens/guard_report.dart';
import 'create_guard.dart';
import 'guard_details.dart';

class GuardListing extends StatefulWidget {
  const GuardListing({Key? key}) : super(key: key);

  @override
  State<GuardListing> createState() => _GuardListingState();
}

class _GuardListingState extends State<GuardListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Guards",
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Guards List",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(page: CreateGuard());
                    },
                    child: Container(
                      height: 4.h,
                      width: 26.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Border width
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add Guards +',
                          style: bodyNormal.copyWith(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Search id',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: true,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: ((context) => DraggableScrollableSheet(
                                    maxChildSize: 0.50,
                                    minChildSize: 0.3,
                                    initialChildSize: 0.40,
                                    builder:
                                        (context, ScrollController scroll) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        ),
                                        child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: StatefulBuilder(
                                              builder: (context, innerstate) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 20,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Icon(Icons
                                                            .arrow_back_ios_new),
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        "Filter",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )
                                                    ],
                                                  ),
                                                  Divider(),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  labeledWidget(
                                                    ' Sort By Apartment',
                                                    CustomDropdown(
                                                      options: const [
                                                        "Black",
                                                        "Brown",
                                                        "Purple",
                                                        "Blue",
                                                        "Green/Black",
                                                        "Green",
                                                      ],
                                                      hint: '  Select',
                                                      onChanged: (String) {},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  labeledWidget(
                                                    'Sort By License Plate',
                                                    CustomDropdown(
                                                      options: const [
                                                        "Paid",
                                                        "Pending",
                                                        "In Process",
                                                        "Completed",
                                                      ],
                                                      hint: '  #oooooo',
                                                      onChanged: (String) {},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          () => GuardReport());
                                                    },
                                                    child: Container(
                                                      height: 5.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff00A3FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: Align(
                                                        child: Text(
                                                          "Search",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    })));
                          },
                          child: Image.asset(
                            Assets.imagesFilter,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 18.h,
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    icon: Icon(Icons.more_vert),
                                    // 3-dots icon
                                    onSelected: (value) {
                                      // Handle the selected value
                                      if (value == "Option 1") {
                                        PageTransition.pageNavigation(
                                            page: const GuardDetails());
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem<String>(
                                          value: 'Option 1',
                                          child: Text('View Details'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Option 2',
                                          child: Text('Eliminate Account'),
                                        ),
                                        PopupMenuItem<String>(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Community Name',
                                    style: bodyNormal,
                                  ),
                                  Text(
                                    'park society',
                                    style:
                                        bodyNormal.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Role',
                                    style: bodyNormal,
                                  ),
                                  Text(
                                    'Security',
                                    style:
                                        bodyNormal.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
