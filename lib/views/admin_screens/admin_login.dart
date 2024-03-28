import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/admin_dashboard.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _isObscured = true;
  bool _isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final url = 'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/login';
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'api_v1_user': {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      }
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', _emailController.text.trim());

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminDashboard()),
        );
      } else {
        final errorMessage = jsonDecode(response.body)['message'];
        print(errorMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                _buildTextField("Email address", _emailController, false,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                }),
                SizedBox(height: 2.h),
                _buildPasswordField("Password", _passwordController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                }),
                SizedBox(height: 2.h),
                _buildRememberAndForgotRow(),
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

  Widget _buildTextField(String label, TextEditingController controller,
      bool isPassword, String? Function(String?)? validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          obscureText: isPassword && _isObscured, // Use _isObscured here
          cursorColor: Color(0xff4B5768),
          style: TextStyle(color: Color(0xff4B5768)),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD0D5DD)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4B5768), width: .1.w),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            hintText: 'Enter your ${label.toLowerCase()}',
            hintStyle: TextStyle(
              color: Color(0xff4B5768),
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      String? Function(String?)? validator) {
    return _buildTextField(label, controller, true, (value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      return null;
    });
  }

  Widget _buildRememberAndForgotRow() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(
          "Remember for 30 days ",
          style: TextStyle(color: Color(0xff667085)),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot password ",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: 6.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Color(0xff00A3FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: TextButton(
          onPressed: _login,
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
