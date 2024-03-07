import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Community Rules",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 9.sp,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "About Community Rules",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
              ],
            ),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Bullet Line",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }
}
