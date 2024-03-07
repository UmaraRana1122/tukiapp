import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/otp_screen.dart';

void alertPOP1(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        child: content1(context),
      );
    },
  );
}

Widget content1(BuildContext context) {
  TextEditingController emailController = TextEditingController();

  return StatefulBuilder(builder: (BuildContext context, setState) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Text(
                "Enter Your Email",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xff4B5768),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  // Validate email and proceed to OTP screen
                  String email = emailController.text.trim();
                  if (isValidEmail(email)) {
                    Get.to(() => OTPScreen());
                  } else {
                    // Show error message if email is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid email"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 7.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Color(0xff00A3FF),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffd49c9c)),
                  ),
                  child: Align(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
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
  });
}

bool isValidEmail(String email) {
  // Simple email validation
  String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(email);
}
