import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/global_variables.dart';
import '../../widgets/custom_widget.dart';
import '../admin_screens/widgets/labeled_textfield.dart';

class CreateTenants extends StatefulWidget {
  const CreateTenants({Key? key}) : super(key: key);

  @override
  State<CreateTenants> createState() => _CreateTenantsState();
}

class _CreateTenantsState extends State<CreateTenants> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController tenantEmailController = TextEditingController();
  TextEditingController tenantPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Create Tenants",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader("Create Tenants", "Upload CSV"),
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
              padding: const EdgeInsets.all(16),
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
    );
  }

  Widget _buildHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.buttonColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  const Icon(Icons.upload, color: AppColors.buttonColor),
                  const SizedBox(width: 5),
                  Text(
                    action,
                    style: const TextStyle(color: AppColors.buttonColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> fields) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                left: 0,
                right: 0,
                bottom: 15.0,
                top: 10.0,
              ),
              child: Text(
                title,
                style: bodyNormal.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            for (var field in fields)
              LabeledTextField(
                heading: field,
                readOnly: false,
                controller: _getControllerForField(field),
              ),
          ],
        ),
      ),
    );
  }

  TextEditingController _getControllerForField(String fieldName) {
    switch (fieldName) {
      case "First Name":
        return firstNameController;
      case "Last Name":
        return lastNameController;
      case "National ID No":
        return nationalIdController;
      case "Email":
        return emailController;
      case "Contact No":
        return contactNoController;
      case "License Plate":
        return licensePlateController;
      case "Building Name":
        return buildingNameController;
      case "Date of Birth":
        return dobController;
      case "Credentials":
        return tenantEmailController;
      case "Password":
        return tenantPasswordController;
      default:
        return TextEditingController();
    }
  }

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
                  "Tenants account created successfully ",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Sign In Credential has been shared with the owner on the Provided Email nelson@gmail.com ",
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        );
      },
    );

    // Close the AlertDialog automatically after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pop();
    });
  }
}
