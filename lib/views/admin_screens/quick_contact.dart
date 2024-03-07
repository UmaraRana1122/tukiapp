import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuickContact extends StatelessWidget {
  const QuickContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quick Contact",
            style: TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.navigate_before_outlined,
              color: Colors.black,
            ), // You can use any other icon you prefer
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "First Name",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                obscureText: true,
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
                    hintText: 'Nelson',
                    hintStyle: TextStyle(
                        color: Color(0xff4B5768),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Email*",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                obscureText: true,
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
                    hintText: 'Nelson@gmail.com',
                    hintStyle: TextStyle(
                        color: Color(0xff4B5768),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Contact No*",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                obscureText: true,
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
                    hintText: '+00 000 0000',
                    hintStyle: TextStyle(
                        color: Color(0xff4B5768),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Message",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                maxLines: 6,
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
              SizedBox(
                height: 3.h,
              ),
              Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Color(0xff00A3FF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14.sp),
                    ),
                  )),
              SizedBox(
                height: 1.h,
              ),
              Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Color(0xff61d3ff),
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff53A4D2),
                          fontSize: 14.sp),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
