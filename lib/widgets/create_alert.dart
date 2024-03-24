import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/create_event.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';
import 'package:tukiapp/views/guards_screens/tennis_detail.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

File? _selectedAttachment;

void alertPOP5(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: Colors.white,
        child: content5(context),
      );
    },
  );
}

Widget content5(BuildContext context) {
  return StatefulBuilder(builder: (BuildContext context, setState) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 40.h,
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
                Text(
                  "Create Alert",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                labeledWidget(
                  'Topic',
                  CustomDropdown(
                    options: const [
                      "A",
                      "B",
                      "C",
                      "D",
                      "E",
                    ],
                    hint: '  Select',
                    onChanged: (String? value) {
                      // Handle the selected value
                    },
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Message",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  maxLines: 3,
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
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff4B5768),
                        width: .1.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Message here....',
                    hintStyle: TextStyle(
                      color: Color(0xff4B5768),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    _showAlertSent(context);
                  },
                  child: Container(
                    height: 5.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Color(0xff00A3FF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffd49c9c)),
                    ),
                    child: Align(
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}

void _showAlertSent(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pop(true); // Close the alert dialog
      });
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assest/images/done.png",
              height: 10.h,
            ),
            SizedBox(height: 1.h),
            Text(
              "Alert Sent",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Alert sent successfully to the whole community owners, co owners, tenants and co tenant.",
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    },
  );
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

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String? hint;
  final void Function(String?)? onChanged;

  const CustomDropdown({
    required this.options,
    this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
      ),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
