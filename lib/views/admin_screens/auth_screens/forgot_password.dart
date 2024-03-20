import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/global_variables.dart';
import '../../../constants/custom_validators.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_widget.dart';
import 'otp_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Enter Your Email",
                      style: bodyLarge.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 3.h),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "We will send you a 4-digit verification OTP code on your email.",
                      style: bodyLarge.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: AuthTextField(
                      controller: emailEditingController,
                      validator: (value) => CustomValidator.email(value),
                      hintText: "Enter Your Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomButton(
                      buttonText: "Done",
                      onTap: () {
                        if (key.currentState!.validate()) {
                          // Generate OTP
                          String otp = _generateOTP();

                          // Send OTP via email
                          _sendOTPByEmail(emailEditingController.text, otp);

                          // Navigate to the OTPScreen
                          Get.to(() => OTPScreen());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generate a random 4-digit OTP
  String _generateOTP() {
    var random = new Random();
    return (1000 + random.nextInt(9000)).toString();
  }

  void _sendOTPByEmail(String email, String otp) {
    print("Sending OTP to $email: $otp");
  }
}
