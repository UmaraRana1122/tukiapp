// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/widgets/custom_alert.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

import '../../generated/assets.dart';

class GuardReport extends StatefulWidget {
  GuardReport({Key? key});

  @override
  State<GuardReport> createState() => _GuardReportState();
}

class _GuardReportState extends State<GuardReport> {
  List<Map<String, dynamic>> guardReportData = [
    {
      "date": "12/09/23",
      "guard": "Titan ja...",
      "amount": "\$1500",
      "status": "Pending",
    },
    {
      "date": "11/08/22",
      "guard": "Goliath...",
      "amount": "\$1200",
      "status": "Completed",
    },
    {
      "date": "10/07/21",
      "guard": "Thunder...",
      "amount": "\$1800",
      "status": "Pending",
    },
    {
      "date": "09/06/20",
      "guard": "Raptor...",
      "amount": "\$2000",
      "status": "Completed",
    },
    {
      "date": "08/05/19",
      "guard": "Phoenix...",
      "amount": "\$1600",
      "status": "Pending",
    },
    {
      "date": "07/04/18",
      "guard": "Dragon...",
      "amount": "\$1400",
      "status": "Completed",
    },
    {
      "date": "06/03/17",
      "guard": "Spartan...",
      "amount": "\$1700",
      "status": "Pending",
    },
    {
      "date": "05/02/16",
      "guard": "Centaur...",
      "amount": "\$1900",
      "status": "Completed",
    },
    {
      "date": "04/01/15",
      "guard": "Cyclops...",
      "amount": "\$1300",
      "status": "Pending",
    },
    {
      "date": "03/12/14",
      "guard": "Athena...",
      "amount": "\$2200",
      "status": "Completed",
    },
  ];

  TextEditingController dateInputController = TextEditingController();

  Widget _buildGuardReportRow(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        alertPOP3(context);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data["date"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data["guard"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data["amount"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 3.5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: Color(0xffefd5f7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    child: Text(
                      data["status"],
                      style: TextStyle(
                        color: Color(0xff9900d6),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.remove_red_eye_sharp,
                  color: Color(0xff00A3FF),
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Guard Report",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ),
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
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Warning List",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 90.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
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
                                        builder:
                                            ((context) =>
                                                DraggableScrollableSheet(
                                                    maxChildSize: 0.63,
                                                    minChildSize: 0.3,
                                                    initialChildSize: 0.50,
                                                    builder: (context,
                                                        ScrollController
                                                            scroll) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25),
                                                          topRight:
                                                              Radius.circular(
                                                                  25),
                                                        ),
                                                        child: Container(
                                                          color:
                                                              Color(0xffFFFFFF),
                                                          child: StatefulBuilder(
                                                              builder: (context,
                                                                  innerstate) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .arrow_back_ios_new),
                                                                      SizedBox(
                                                                        width:
                                                                            3.w,
                                                                      ),
                                                                      Text(
                                                                        "Filter",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 16.sp,
                                                                            fontWeight: FontWeight.w600),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Divider(),
                                                                  Text(
                                                                    "Date",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 1.h,
                                                                  ),
                                                                  TextFormField(
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              12),
                                                                      hintText:
                                                                          'Date',
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                              12)),
                                                                          borderSide: BorderSide(
                                                                              color: Colors.grey,
                                                                              width: 1)),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12)),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12)),
                                                                      ),
                                                                    ),
                                                                    controller:
                                                                        dateInputController,
                                                                    readOnly:
                                                                        true,
                                                                    onTap:
                                                                        () async {
                                                                      DateTime? pickedDate = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime(
                                                                              1950),
                                                                          lastDate:
                                                                              DateTime(2050));

                                                                      if (pickedDate !=
                                                                          null) {
                                                                        dateInputController.text =
                                                                            pickedDate.toString();
                                                                      }
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  labeledWidget(
                                                                    ' Guard',
                                                                    CustomDropdown(
                                                                      options: const [
                                                                        "Black",
                                                                        "Brown",
                                                                        "Purple",
                                                                        "Blue",
                                                                        "Green/Black",
                                                                        "Green",
                                                                      ],
                                                                      hint:
                                                                          '  Select',
                                                                      onChanged:
                                                                          (String) {},
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  labeledWidget(
                                                                    'Status',
                                                                    CustomDropdown(
                                                                      options: const [
                                                                        "Paid",
                                                                        "Pending",
                                                                        "In Process",
                                                                        "Completed",
                                                                      ],
                                                                      hint:
                                                                          '  Pending',
                                                                      onChanged:
                                                                          (String) {},
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.to(() =>
                                                                          GuardReport());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          5.h,
                                                                      width:
                                                                          100.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff00A3FF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12)),
                                                                      child:
                                                                          Align(
                                                                        child:
                                                                            Text(
                                                                          "Search",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 14.sp,
                                                                              fontWeight: FontWeight.w600),
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
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 5.h,
                      width: 100.w,
                      decoration: BoxDecoration(color: Colors.black12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Guard",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "View",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: guardReportData
                          .map((data) => _buildGuardReportRow(data))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget labeledWidget(heading, child) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 0,
      right: 0,
      bottom: 10.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        child,
      ],
    ),
  );
}
