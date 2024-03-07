import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/widgets/labeled_textfield.dart';
import 'package:tukiapp/views/guest_final/information.dart';
import 'package:tukiapp/views/guest_final/new_card.dart';
import 'package:tukiapp/views/guest_final/payment.dart';
import '../../../generated/assets.dart';

import '../../../constants/global_variables.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int currentindex = 0;
  int selectedIndex = 0;
  int selectIndex = 0;

  Widget _buildSection(
    String title,
    List<String> fields,
    List<String> hintList,
  ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a widget to display the picked image

          for (int i = 0; i < fields.length; i++)
            LabeledTextField(
              heading: fields[i],
              hintText: hintList.length > i ? hintList[i] : '',
              readOnly: false,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  onTap: (index) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                  indicatorColor: Colors.transparent, // Hide indicator
                  tabs: [
                    _buildTab(0, "Booking"),
                    _buildTab(1, "Information"),
                    _buildTab(2, "Payment"),
                  ],
                ),
                if (currentindex == 0) // Show only if Booking tab is active
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booker Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _buildSection(
                        "Personal Details",
                        [
                          "Name",
                          "National ID No",
                          "Email",
                          "Contact No",
                        ],
                        [
                          "Nelson",
                          "Nelson Aston",
                          "nelsonaston@gmail.com",
                          "+00 0000 0000",
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Guest Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _buildSection(
                        "Guest Details",
                        [
                          "Name",
                          "National ID No",
                          "Email",
                          "Password"
                              "Contact No",
                        ],
                        [
                          "Nelson",
                          "Nelson Aston",
                          "nelsonaston@gmail.com",
                          "**********",
                          "+00 0000 0000",
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 3.5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Align(
                            child: Text(
                              "Add Guest +",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Align(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (currentindex == 1) // Show only if Information tab is active
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ticket Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "ID#111111332",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 100.w,
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
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "First Name:",
                                      style: bodyNormal.copyWith(
                                          color: Colors.grey[700]),
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
                                          color: Colors.grey[700]),
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
                                          color: Colors.grey[700]),
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
                                          color: Colors.grey[700]),
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
                        ),
                        Text(
                          "Guest Ticket Details",
                          style: bodyNormal.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: 100.w,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 5.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            child: Text(
                              "Make Payment",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                if (currentindex == 2) // Show only if Payment tab is active
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Select Payment Methods",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Container(
                                height: 7.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 0
                                      ? Colors.blue
                                      : Color(0xffD3D3D3),
                                  border: Border.all(
                                    color: selectedIndex == 0
                                        ? Colors.grey
                                        : Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assest/images/pay.png",
                                      height: 3.h,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Container(
                                  height: 7.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? Colors.blue
                                        : Color(0xffD3D3D3),
                                    border: Border.all(
                                      color: selectedIndex == 1
                                          ? Colors.grey
                                          : Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.card_giftcard_rounded),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Credit/\nDebit Card",
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: Container(
                                  height: 7.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 2
                                        ? Colors.blue
                                        : Color(0xffD3D3D3),
                                    border: Border.all(
                                      color: selectedIndex == 2
                                          ? Colors.grey
                                          : Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assest/images/home.png",
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Bank \nTransfer",
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = 0;
                            });
                          },
                          child: Container(
                            height: 5.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Align(
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 0,
                                    groupValue: selectIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectIndex = value!;
                                      });
                                    },
                                  ),
                                  Image.asset("assest/images/card.png"),
                                  Text(
                                    "568 ******* 4532",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = 1;
                            });
                          },
                          child: Container(
                            height: 5.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Align(
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    groupValue: selectIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectIndex = value!;
                                      });
                                    },
                                  ),
                                  Image.asset("assest/images/card.png"),
                                  InkWell(
                                    onTap: () {
                                      Get.to(NewCard());
                                    },
                                    child: Text(
                                      "Add new card",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Order Summary",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sub Total",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$200",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Tax",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "10%",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "220%",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 5.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            child: Text(
                              "Make Payment",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
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
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    Color circleColor =
        currentindex == index ? Colors.blue : Colors.blue.withOpacity(0.7);
    Color textColor =
        currentindex == index ? Colors.black : Colors.grey.withOpacity(0.7);

    return Tab(
      child: Row(
        children: [
          CircleAvatar(
            radius: 1.2.h,
            backgroundColor: circleColor,
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 7.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentContainer(int index, String title) {
    Color containerColor =
        selectedIndex == index ? Colors.red : Colors.transparent;
    Color borderColor =
        selectedIndex == index ? Colors.grey : Colors.transparent;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 7.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assest/images/pay.png",
                  height: 2.h,
                )),
          ],
        ),
      ),
    );
  }
}
