import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/global_variables.dart';
import '../../../constants/custom_validators.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_widget.dart';
import 'login_screen.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController cPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

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
                      "Create a New Password",
                      style: bodyLarge.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 3.h),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AuthTextField(
                      controller: passwordEditingController,
                      validator: (value) => CustomValidator.password(value),
                      hintText: "New Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AuthTextField(
                      controller: cPasswordEditingController,
                      validator: (value) => CustomValidator.confirmPassword(
                          value, passwordEditingController.text),
                      hintText: "Confirm Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomButton(
                      buttonText: "Done",
                      onTap: () {
                        if (key.currentState != null &&
                            key.currentState!.validate()) {
                          // Passwords are valid, navigate to LoginScreen
                          Get.to(() => LoginScreen());
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
}
