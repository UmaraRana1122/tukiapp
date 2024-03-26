import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';
import 'package:tukiapp/views/admin_screens/widgets/custom_alert.dart';
import 'package:tukiapp/views/guards_screens/guard_report.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

import '../../generated/assets.dart';

class ValidationLog extends StatefulWidget {
  ValidationLog({Key? key});

  @override
  State<ValidationLog> createState() => _ValidationLogState();
}

class _ValidationLogState extends State<ValidationLog> {
  List<Map<String, dynamic>> guardReportData = [
    {
      "name": "Titan jam..",
      "time": "12:00 AM",
      "status": "Pending",
      "By": "Mybape",
    },
    {
      "name": "Titan jam..",
      "time": "11:00 PM",
      "status": "Pending",
      "By": "Neston Max",
    },
    {
      "name": "Titan jam..",
      "time": "12:00 PM",
      "status": "Pending",
      "By": "Messy",
    },
    {
      "name": "Titan jam..",
      "time": "10:00 AM",
      "status": "Cancelled",
      "By": "K.Mybape",
    },
    {
      "name": "Titan jam..",
      "time": "12:00 AM",
      "status": "In Process",
      "By": "C.Ronaldo",
    },
    {
      "name": "Titan jam..",
      "time": "12:00 AM",
      "status": "Completed",
      "By": "Rodrigo JR",
    },
    {
      "name": "Titan jam..",
      "time": "12:00 AM",
      "status": "Pending",
      "By": "Alvarez",
    },
    {
      "name": "Titan jam..",
      "time": "12:00 AM",
      "status": "Cancelled",
      "By": "James flip",
    },
  ];

  TextEditingController dateInputController = TextEditingController();

  Widget _buildGuardReportRow(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        alertPOP3(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data["name"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data["By"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data["status"],
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _showQRScanAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 30.h,
              width: 100.w,
              child: Column(
                children: [
                  Text(
                    "Scan QR",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBatchCheckInAlert(context);
                    },
                    child: Container(
                      height: 4.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        child: Text(
                          "Batch Check In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 4.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      child: Text(
                        "Batch Check Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 4.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      child: Text(
                        "Batch Detach",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 4.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      child: Text(
                        "Check In With Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBatchCheckInAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 30.h,
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "Titan Adrew",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 9.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "titanandrew@gmail.com",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "00000000000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 9.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nationality",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "CL",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "NID",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp),
                ),
                Text(
                  "09876543-9",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            child: Text(
                          "Check In",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            child: Text(
                          "Check Out",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: Align(
                            child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Validation Log",
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
                                      maxChildSize: 0.63,
                                      minChildSize: 0.3,
                                      initialChildSize: 0.50,
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
                                                  padding: const EdgeInsets
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
                                                          SizedBox(width: 3.w),
                                                          Text(
                                                            "Filter",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "Date",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  12),
                                                          hintText: 'Date',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                        ),
                                                        controller:
                                                            dateInputController,
                                                        readOnly: true,
                                                        onTap: () async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1950),
                                                            lastDate:
                                                                DateTime(2050),
                                                          );

                                                          if (pickedDate !=
                                                              null) {
                                                            dateInputController
                                                                    .text =
                                                                pickedDate
                                                                    .toString();
                                                          }
                                                        },
                                                      ),
                                                      SizedBox(height: 2.h),
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
                                                          hint: '  Select',
                                                          onChanged:
                                                              (String) {},
                                                        ),
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      labeledWidget(
                                                        'Status',
                                                        CustomDropdown(
                                                          options: const [
                                                            "Paid",
                                                            "Pending",
                                                            "In Process",
                                                            "Completed",
                                                          ],
                                                          hint: '  Pending',
                                                          onChanged:
                                                              (String) {},
                                                        ),
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              GuardReport());
                                                        },
                                                        child: Container(
                                                          height: 5.h,
                                                          width: 100.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff00A3FF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Align(
                                                            child: Text(
                                                              "Search",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                              );
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Time",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "By",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Status",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
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
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _showQRScanAlert(context);
                  },
                  child: Container(
                    height: 5.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffBCD0F3),
                      border: Border.all(
                        color: const Color(0xffBCD0F3), // Border width
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assest/images/qrIcon.png",
                                  height: 3.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  'Scan QR With Verification',
                                  style: bodyNormal,
                                ),
                              ],
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
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
