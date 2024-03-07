import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/custom_navigation.dart';
import 'package:tukiapp/constants/custom_validators.dart';
import 'package:tukiapp/constants/global_variables.dart';
import 'package:tukiapp/views/admin_screens/owner_details.dart';
import 'package:tukiapp/views/admin_screens/widgets/labeled_textfield.dart';
import 'package:tukiapp/views/guards_screens/tennis_detail.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

import '../../generated/assets.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Guest List",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Guest List",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
                    ),
                    Spacer(),
                    Container(
                      height: 4.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.blue)),
                      child: Align(
                          child: Text(
                        "Add Guest +",
                        style: TextStyle(color: Colors.blue),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
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
                            text: "Working Guest",
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
                            text: "Guest",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20.h,
                          width: 100.w,
                          decoration: BoxDecoration(color: Color(0xfff0f9ff)),
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
                                        height: 6.h,
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
                                            style:
                                                TextStyle(color: Colors.grey),
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
                                            page: const OwnerDetails());
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem<String>(
                                          value: 'Option 1',
                                          child: Text('Eliminate Account'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Option 2',
                                          child: Text('Send Warning'),
                                        ),
                                      ];
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    "Invited By",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Nelson Aston",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Purpose of Guest",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Text(
                                    "House Job",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20.h,
                          width: 100.w,
                          decoration: BoxDecoration(color: Color(0xfff0f9ff)),
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
                                        height: 6.h,
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
                                            style:
                                                TextStyle(color: Colors.grey),
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
                                            page: const OwnerDetails());
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        PopupMenuItem<String>(
                                          value: 'Option 1',
                                          child: Text('Eliminate Account'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Option 2',
                                          child: Text('Send Warning'),
                                        ),
                                      ];
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    "Invited By",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Nelson Aston",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Purpose of Guest",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Text(
                                    "House Job",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (currentIndex == 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      _buildSection("Personal Details", [
                        "First Name",
                        "Last Name",
                        "National ID No",
                        "Email",
                        "Contact No",
                      ]),
                      _buildSection("Other Details", [
                        "License Plate",
                        "Building Name",
                        "Date of Birth",
                      ]),
                      _buildSection("Credentials", ["Email", "Password"]),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                          child: Text(
                            "Confirm and generate QR Code",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSection(String title, List<String> fields) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: 95.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                bottom: 15.0,
                top: 10.0,
              ),
              child: Text(
                title,
                style: bodyNormal.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            for (var field in fields)
              LabeledTextField(
                heading: field,
                validator: (value) => CustomValidator.email(value), readOnly: false,
              ),
          ],
        ),
      ),
    ),
  );
}
