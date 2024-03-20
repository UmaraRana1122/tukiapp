import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import 'new_password.dart';
import '../../../constants/global_variables.dart';
typedef void OnDoneCallback();

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  
  final TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool hasError = false;

  StreamController<ErrorAnimationType>? errorController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "OTP Code",
          style: bodyLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 3.h),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We will send you a 4-digit verification OTP code on your email.",
              style: bodyLarge.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 10.sp),
            ),
            SizedBox(height: 2.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) =>
                  v!.length < 4 ? "Please enter a valid OTP" : null,
              pinTheme: PinTheme(
                selectedColor: AppColors.primaryColor,
                selectedFillColor: Colors.white,
                activeColor: Colors.grey,
                activeFillColor: Colors.white,
                shape: PinCodeFieldShape.box,
                inactiveColor: Colors.grey,
                inactiveFillColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 55.w / 3.6,
                fieldWidth: 55.w / 3.6,
              ),
              cursorColor: AppColors.secondaryColor,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {},
              onChanged: (value) {
                setState(() {
                  currentText = value;
                  hasError = false;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
       TextButton(
          onPressed: () {
            if (key.currentState != null && key.currentState!.validate()) {
              Get.to(() => const NewPassword());
            }
          },
          child: Text("Done"),
        ),
      ],
    );
  }
}
