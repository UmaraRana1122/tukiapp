import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:tukiapp/views/guards_screens/guard_dashboard.dart';
import 'package:tukiapp/views/guest_final/guest_dashboard.dart';

class GuardLogin extends StatefulWidget {
  const GuardLogin({Key? key}) : super(key: key);

  @override
  State<GuardLogin> createState() => _GuardLoginState();
}

class _GuardLoginState extends State<GuardLogin> {
  bool _isObscured = true;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Center(
                  child: Text(
                    "Log in to your account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Welcome back! Please enter your details.",
                    style: TextStyle(
                      color: Color(0xff667085),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                _buildTextField("Email address", _emailController),
                SizedBox(height: 2.h),
                _buildPasswordField(
                    "Password", _passwordController, _isObscured),
                SizedBox(height: 2.h),
                _buildRememberForgotRow(),
                SizedBox(height: 4.h),
                _buildSignInButton(),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          cursorColor: Color(0xff4B5768),
          style: TextStyle(color: Color(0xff4B5768)),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.sp),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD0D5DD)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4B5768), width: .1.w),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            hintText: 'Enter your $labelText',
            hintStyle: TextStyle(
              color: Color(0xff4B5768),
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: labelText == "Password"
                ? IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your $labelText';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildRememberForgotRow() {
    return Row(
      children: [
        CustomCheckBox(
          value: _isChecked,
          shouldShowBorder: true,
          borderColor: Color(0xff808B95),
          uncheckedFillColor: Colors.white,
          uncheckedIconColor: Colors.transparent,
          checkedIconColor: Color(0xff03314B),
          checkedFillColor: Color(0xff808B95),
          borderRadius: 8,
          borderWidth: .5,
          checkBoxSize: 22.sp,
          onChanged: (val) {
            setState(() {
              _isChecked = val;
            });
          },
        ),
        Text(
          "Remember for 30 days",
          style: TextStyle(color: Color(0xff667085)),
        ),
        Spacer(),
        Text(
          "Forgot password",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Get.to(GuardDashboard());
        }
      },
      child: Container(
        height: 6.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Color(0xff00A3FF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      String labelText, TextEditingController controller, bool obscureText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
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
            hintText: 'Enter your password',
            hintStyle: TextStyle(
              color: Color(0xff4B5768),
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: labelText == "Password"
                ? IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your $labelText';
            }
            return null;
          },
        ),
      ],
    );
  }
}
