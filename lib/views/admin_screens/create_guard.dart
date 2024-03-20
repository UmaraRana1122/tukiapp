import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_widget.dart';
import 'create_owner.dart';
import 'widgets/labeled_textfield.dart';

class CreateGuard extends StatefulWidget {
  const CreateGuard({Key? key}) : super(key: key);

  @override
  State<CreateGuard> createState() => _CreateGuardState();
}

class _CreateGuardState extends State<CreateGuard> {
  // Create controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from closing on outside tap
      builder: (BuildContext context) {
        // Show the AlertDialog
        return AlertDialog(
          content: Container(
            height: 25.h,
            child: Column(
              children: [
                Image.asset(
                  "assest/images/done.png",
                  height: 10.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Guard profile created successfully",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Credentials have been sent to the provided Email",
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        );
      },
    );

    // Close the AlertDialog automatically after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Guard Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              _buildSection("Personal Details", [
                "First Name",
                "Last Name",
                "National ID No",
                "Email",
                "Contact No",
              ]),
              _buildSection("Other Details", [
                "License Plate",
                "Building Name",
                "Date of Birth",
              ]),
              _buildSection("Credentials", ["Email", "Password"]),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CustomButton(
                  buttonText: "Done",
                  onTap: () {
                    _showAlertDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> fields) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 95.w,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 0,
                bottom: 5.0,
                top: 10.0,
              ),
              child: Text(
                title,
                style: bodyNormal.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            for (var field in fields)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LabeledTextField(
                  heading: field,
                  validator: (value) => CustomValidator.email(value),
                  controller: _getController(field),
                  readOnly: false,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper method to get the appropriate controller for each field
  TextEditingController _getController(String field) {
    switch (field) {
      case "First Name":
        return _firstNameController;
      case "Last Name":
        return _lastNameController;
      case "National ID No":
        return _nationalIdController;
      case "Email":
        return _emailController;
      case "Contact No":
        return _contactController;
      case "License Plate":
        return _licensePlateController;
      case "Building Name":
        return _buildingNameController;
      case "Date of Birth":
        return _dobController;
      case "Password":
        return _passwordController;
      default:
        return TextEditingController();
    }
  }
}
