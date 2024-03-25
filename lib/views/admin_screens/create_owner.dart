import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tukiapp/models/owner_model.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widget.dart';
import 'widgets/labeled_textfield.dart';

class CreateOwner extends StatefulWidget {
  const CreateOwner({Key? key}) : super(key: key);

  @override
  State<CreateOwner> createState() => _CreateOwnerState();
}

class _CreateOwnerState extends State<CreateOwner> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  bool isLoading = false;
  OwnerModel? own;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> postUserData() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Authorization': 'postUserData()',
      'Cookie':
          'auth_session=wt1iyQmOgYArGSFxlxDvsdkPbLvFBGRRmT7H4NRG2CcMTO58AtfyKrbWCPqNXiBTlIof8sFIyry%2FCQEd%2F0I89qW6aH%2FEEvtmZnYhYvz1y2dMVufH5L7UlOouScs8XrN9eLbsIGDVBL6T9vcMzoV2Rv%2FUolnlNU%2FUf03NzMfPvET%2FFehoLEFV4CNC4t1YtkL1p0uF27zn%2BPNV3ZqfkRtgHTpsqYJ%2BFtkJRaUEVp7nt19Vt%2FTq48rRzPCdwKuCHUS4KrOraBji%2FNtU%2FfatvKpao%2FWtQLb0jNEUN6J4pgpbA12DwMYWPvQLQirIsUdvAWUDJ%2BRj86IsDL9LYIAA36VHc9R270cmHJwCdl7piEpK6Ts%3D--8nk1%2BLxu2izCgVz3--7tx3HhbPu4%2F%2FZBBvncNjLw%3D%3D'
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/owners'),
    );
    request.fields.addAll({
      'owner[first_name]': _firstNameController.text,
      'owner[last_name]': _lastNameController.text,
      'owner[national_id]': _nationalIdController.text,
      'owner[contact]': _contactController.text,
      'owner[birthdate]': _dobController.text,
      'owner[email]': _emailController.text,
      'owner[password]': _passwordController.text,
      'apartment[number]': '40',
      'apartment[license_plate]': _licensePlateController.text,
      'owner[password_confirmation]': _passwordController.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      _showSuccessDialog();
    } else {
      print(response.reasonPhrase);
      _showErrorSnackbar(response.reasonPhrase);
    }

    setState(() {
      isLoading = false;
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                  "Owner account created successfully",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Sign In Credential has been shared with the owner on the Provided Email nelson@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pop();
    });
  }

 void _showErrorSnackbar(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? "Unknown error occurred"),
        duration: Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Create Owner",
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
            _buildHeader("Create Owner", "Upload CSV", _openFileExplorer),
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
                onTap: postUserData,
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildHeader(String title, String action, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(action),
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
                controller: _getController(field),
                readOnly: false,
              ),
          ],
        ),
      ),
    );
  }

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

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      _processCSVFile(file);
    } else {}
  }

  void _processCSVFile(File file) {
    print("Selected CSV file path: ${file.path}");
  }
}
