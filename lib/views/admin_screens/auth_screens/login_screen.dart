import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/global_variables.dart';
import 'forgot_password.dart';

import '../../../constants/custom_navigation.dart';
import '../../../constants/custom_validators.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_widget.dart';
import '../admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  bool _rememberMe = false;

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
                      "Log in to your account",
                      style: bodyLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 3.h),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome back! Please enter your details",
                      style: bodyLarge.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, bottom: 5.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email address", style: hintText.copyWith(color: AppColors.hintColor))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: AuthTextField(
                      controller: emailEditingController,
                      validator: (value) => CustomValidator.email(value),
                      hintText: "Enter your email address",
                      // prefixIcon: AppImages.emailIcon,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0, bottom: 5.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password", style: hintText.copyWith(color: AppColors.hintColor))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: AuthTextField(
                      controller: passwordEditingController,
                      validator: (value) => CustomValidator.password(value),
                      hintText: "Enter your password",
                      // prefixIcon: AppImages.emailIcon,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rememberMe = !_rememberMe;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 14.0,
                              height: 14.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: _rememberMe ? AppColors.primaryColor : Colors.white,
                                  width: 2.0,
                                ),
                                color: _rememberMe ? AppColors.primaryColor : Colors.white,
                              ),
                              child: _rememberMe
                                  ? const Icon(
                                      Icons.check,
                                      size: 10.0,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 3.0),
                            Text(
                              'Remember for 30 days',
                              style: hintText.copyWith(
                                  color: AppColors.hintColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ForgotPassword());
                        },
                        child: Text(
                          "Forgot password",
                          style:
                              hintText.copyWith(color: AppColors.hintColor, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomButton(
                      buttonText: "Sign in",
                      onTap: () {
                        PageTransition.pageProperNavigation(page: const AdminDashboard());

                        // Map<String, String> map = {
                        //   'api_v1_user[email]':
                        //       emailEditingController.text.toString(),
                        //   'api_v1_user[password]':
                        //       passwordEditingController.text.toString(),
                        // };
                        // if (key.currentState!.validate()) {
                        //   FocusManager.instance.primaryFocus!.unfocus();
                        //   _authController.userLogin(map, context, false);
                        // }
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Don't have an account?",
                  //         style: bodyNormal.copyWith(color: Colors.black54),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       const SizedBox(
                  //         width: 5,
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           // Get.off(() => SignUpScreen(
                  //           //   controller: TextEditingController(),
                  //           // ));
                  //         },
                  //         child: Text(
                  //           "Sign up",
                  //           style: bodyLarge.copyWith(
                  //               fontFamily: "MontserratSemiBold",
                  //               color: AppColors.buttonColor,
                  //               decoration: TextDecoration.underline),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
