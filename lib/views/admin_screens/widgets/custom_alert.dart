import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';

File? _selectedAttachment;
void alertPOP3(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          child: content3());
    },
  );
}

Widget content3() {
  return StatefulBuilder(builder: (BuildContext context, setState) {
    return Container(
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
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "12/09/23",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Guard:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "Tatan Jamie",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warning Title:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "Fighting with Guests",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fine Amount",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        "\$1200",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: .5.h,
              ),
              Text(
                "Fine Message:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: .5.h,
              ),
              Text(
                "message will come here whatever it will be okay",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp),
              ),
              Text(
                "Attachment:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              _selectedAttachment != null
                  ? Row(
                      children: [
                        Icon(Icons.attach_file),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _selectedAttachment!.path.split('/').last,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _selectedAttachment = null;
                            });
                          },
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {
                            _selectedAttachment =
                                File(result.files.single.path!);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.attach_file),
                          SizedBox(width: 10),
                          Text(
                            "Attach File",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => Settings());
                    },
                    child: Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: Color(0xff1BB200),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffd49c9c)),
                      ),
                      child: Align(
                        child: Text(
                          "approve",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: Color(0xffD90000),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffd49c9c)),
                      ),
                      child: Align(
                        child: Text(
                          "Deny",
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
              )
            ],
          ),
        ),
      ),
    );
  });
}
