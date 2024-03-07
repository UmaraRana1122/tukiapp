import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';
import 'package:tukiapp/generated/assets.dart';
import 'package:tukiapp/views/guards_screens/guard_report.dart';
import 'package:tukiapp/widgets/alert8.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/custom_widget.dart';
import 'package:tukiapp/widgets/dropWidget.dart';

import '../../constants/custom_navigation.dart';
import '../admin_screens/owner_details.dart';

class ListCoOwner extends StatelessWidget {
  const ListCoOwner({Key? key});

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
        title: const Text('Co Owners'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Co Owners List",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              ),
              Spacer(),
              Container(
                height: 3.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Align(
                  child: Text(
                    "Add Co Owners +",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 8.sp),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: 'Search id',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 2.h),
          _buildCoOwnerWidget(context),
          SizedBox(
            height: 2.h,
          ),
          _buildCoOwnerWidget(context),
          SizedBox(
            height: 2.h,
          ),
          _buildCoOwnerWidget(context),
          SizedBox(
            height: 2.h,
          ),
          _buildCoOwnerWidget(context),
        ],
      ),
    );
  }

  Widget _buildCoOwnerWidget(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff0f9ff),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nelson Aston',
                      style: bodyNormal,
                    ),
                    Text(
                      'nelson@gmail.com',
                      style: TextStyle(color: Colors.grey),
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
                  _showWarningAlert(context, "Fighting");
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Eliminate Account'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Send Warning'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
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
            title,
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
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff4B5768),
                        width: .1.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Write your message',
                    hintStyle: TextStyle(
                      color: Color(0xff4B5768),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      child: Text(
                        "Eliminate",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
