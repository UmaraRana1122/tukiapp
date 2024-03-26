import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sizer/sizer.dart';
import 'package:tukiapp/widgets/alert8.dart';
import 'package:tukiapp/widgets/dropWidget.dart';
import 'package:tukiapp/widgets/warning_alert.dart';

File? _selectedAttachment;

void alertPOP6(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        child: content6(),
      );
    },
  );
}

Widget content6() {
  bool isPaid = false; // Set the status here based on your condition

  return StatefulBuilder(builder: (BuildContext context, setState) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 70.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Common  Expenses",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 3.5.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CustomDrop(
                        options: const [
                          "2020",
                          "2021",
                          "2022",
                          "2023",
                          "2024",
                        ],
                        hint: '  2024',
                        onChanged: (String) {},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 4.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          color: Color(0xff1BB200),
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          child: Text(
                        "Paid",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                    ),
                    Spacer(),
                    Container(
                      height: 4.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border.all(color: Color(0xffFF0000)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                          child: Text(
                        "Paid",
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                MonthStatus(
                  month: "January",
                  amount: 500,
                  isPaid: isPaid,
                ),
                SizedBox(
                  height: 1.h,
                ),
                MonthStatus(
                  month: "February",
                  amount: 600,
                  isPaid: isPaid,
                ),
                SizedBox(
                  height: 1.h,
                ),
                MonthStatus(
                  month: "March",
                  amount: 700,
                  isPaid: isPaid,
                ),
                SizedBox(
                  height: 1.h,
                ),
                MonthStatus(
                  month: "April",
                  amount: 800,
                  isPaid: isPaid,
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}

class MonthStatus extends StatefulWidget {
  final String month;
  final int amount;
  final bool isPaid;

  const MonthStatus({
    Key? key,
    required this.month,
    required this.amount,
    required this.isPaid,
  }) : super(key: key);

  @override
  _MonthStatusState createState() => _MonthStatusState();
}

class _MonthStatusState extends State<MonthStatus> {
  int _amount = 0;

  @override
  void initState() {
    super.initState();
    _amount = widget.amount;
  }

  void _updateAmount(int newAmount) {
    setState(() {
      _amount = newAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.month,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 0.5.h),
        CustomStatusTextField(
          amount: _amount,
          isPaid: widget.isPaid,
          onTap: () {
            editAmountAlert(context, _amount, _updateAmount);
          },
        ),
      ],
    );
  }
}

class CustomStatusTextField extends StatelessWidget {
  final int amount;
  final bool isPaid;
  final Function() onTap;

  const CustomStatusTextField({
    Key? key,
    required this.amount,
    required this.isPaid,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 7.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$amount",
                style: TextStyle(
                  color: Color(0xff1BB200),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                isPaid ? "Paid" : "In Process",
                style: TextStyle(
                  color: isPaid ? Colors.green : Colors.orange,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void editAmountAlert(
    BuildContext context, int currentAmount, Function(int) onUpdate) {
  int newAmount = currentAmount;
  List<String> weekDays = [
    'Fighting',
    'Love',
    'Peace',
  ];
  String selectedDay = 'Fighting';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Warnings",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CustomDrop(
                        options: const [
                          "Fighting",
                          "Love",
                          "Peace",
                        ],
                        hint: 'Fighting',
                        onChanged: (String value) {
                          setState(() {
                            selectedDay = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: weekDays
                        .map(
                          (day) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day;
                              });
                              if (selectedDay == 'Fighting') {
                                // Show a new alert or navigate to a new screen
                                Navigator.of(context).pop();
                                _showWarningAlert(context, selectedDay);
                              } else if (selectedDay == 'Love') {
                                // Show Love alert
                                Navigator.of(context).pop();
                                _showWarningAlert(context, selectedDay);
                              } else if (selectedDay == 'Peace') {
                                // Show Peace alert
                                Navigator.of(context).pop();
                                _showWarningAlert(context, selectedDay);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedDay == day
                                      ? Colors.blue
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: selectedDay == day
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Fine Amount'),
                  onChanged: (value) {
                    newAmount = int.tryParse(value) ?? currentAmount;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onUpdate(newAmount);
                  Navigator.of(context).pop(); // Close the alert
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    },
  );
}

void _showWarningAlert(BuildContext context, String warningType) {
  String title = '';
  String content = '';

  if (warningType == 'Fighting') {
    title = 'Fighting Alert';
    content = 'This is the alert for Fighting.';
  } else if (warningType == 'Love') {
    title = 'Love Alert';
    content = 'This is the alert for Love.';
  } else if (warningType == 'Peace') {
    title = 'Peace Alert';
    content = 'This is the alert for Peace.';
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(
            "Elimination Reason",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: Container(
            width: 100.w, // Set your desired width
            height: 40.h, // Set your desired height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason*",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                CustomDrop(
                  options: const [
                    "Fighting",
                    "Love",
                    "Peace",
                  ],
                  hint: '  Fighting',
                  onChanged: (String) {},
                ),
                SizedBox(height: 2.h),
                Text(
                  "Fine Amount",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                CustomDrop(
                  options: const [
                    "\$100",
                    "\$200",
                    "\$500",
                  ],
                  hint: '  \$',
                  onChanged: (String) {},
                ),
                SizedBox(height: 1.h),
                Text(
                  "Message",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Color(0xff4B5768),
                  style: TextStyle(color: Color(0xff4B5768)),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD0D5DD),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff4B5768),
                            width: .1.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Write your message',
                      hintStyle: TextStyle(
                          color: Color(0xff4B5768),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
          actions: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    alertPOP8(context);
                  },
                  child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Color(0xff00A3FF),
                          borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        child: Text(
                          "Eliminate",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14.sp),
                        ),
                      )),
                ),
              ],
            )
          ]);
    },
  );
}

void _showFightingAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(
            "Warning",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: Container(
            width: 100.w, // Set your desired width
            height: 40.h, // Set your desired height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                CustomDrop(
                  options: const [
                    "Fighting",
                    "Love",
                    "Peace",
                  ],
                  hint: '  Fighting',
                  onChanged: (String) {},
                ),
                SizedBox(height: 2.h),
                Text(
                  "Fine Amount",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                CustomDrop(
                  options: const [
                    "\$100",
                    "\$200",
                    "\$500",
                  ],
                  hint: '  \$',
                  onChanged: (String) {},
                ),
                SizedBox(height: 1.h),
                Text(
                  "Message",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Color(0xff4B5768),
                  style: TextStyle(color: Color(0xff4B5768)),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD0D5DD),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff4B5768),
                            width: .1.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Write your message',
                      hintStyle: TextStyle(
                          color: Color(0xff4B5768),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
          actions: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    alertPOP7(context);
                  },
                  child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Color(0xff00A3FF),
                          borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14.sp),
                        ),
                      )),
                ),
              ],
            )
          ]);
    },
  );
}
