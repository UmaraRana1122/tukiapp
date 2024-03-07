import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/create_event.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

File? _selectedAttachment;
void alertPOP4(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          child: content4());
    },
  );
}

Widget content4() {
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
                  Text(
                    "Common  Expenses",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              labeledWidget(
                'Building Name*',
                CustomDropdown(
                  options: const [
                    "A",
                    "B",
                    "C",
                    "D",
                    "E",
                  ],
                  hint: '  Select',
                  onChanged: (String) {},
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              labeledWidget(
                'Charges*',
                CustomDropdown(
                  options: const [
                    "\$500",
                    "\$200",
                    "\$100",
                    "\$50",
                    "\$300",
                  ],
                  hint: '  \$500',
                  onChanged: (String) {},
                ),
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
              InkWell(
                onTap: () {
                  Get.back();
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
    );
  });
}
