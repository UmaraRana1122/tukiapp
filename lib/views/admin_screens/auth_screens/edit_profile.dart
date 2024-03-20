import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/login_screen.dart';

import '../../../generated/assets.dart';
import '../../../constants/global_variables.dart';

class LabeledTextField extends StatelessWidget {
  final String heading;
  final String hintText;
  final TextEditingController controller;

  const LabeledTextField({
    required this.heading,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController communityNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getEditData();
  }

  Future<void> getEditData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var headers = {
        'Authorization': 'Bearer {{token}}',
        'Cookie':
            'auth_session=nJB8bgbagrPdjajk0Eo6%2BPYl0xXCeHz4Cy5ylguOyBsZm1YWR2HbBzrykCFgXL3iSeDpw%2BbvzWqz9bXDFGH1IH%2FpLPmvRQECmU2FE7SISAU6ezdoxSTKX6qYUz1LkqFuWp2%2BNnOJlNgOFE7pyLDhBwlsKMizCCW%2BryPp4J7Agl5l16mgEVmV8qnfV3dVwVZh4BRR9XqYUqT9MBP%2BnJGJ%2Bfkb8JPQDrf6BA8mprweau3bwnD5TVtCD7gkHxdPfttc6MKZdMtB9TwMcO3APkFHNjc2s0efFC1ToITpA090uLTpUUSDZJADuVtoBe73fGDjSx9hnDwRt9cs1jfg2fSeV10H7Qi8NWnrTNLHSPLeVxs%3D--%2FGF02P1IWClc9qs%2B--avPnBaWzC0IfUf766d99jQ%3D%3D'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/owners'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);

        firstNameController.text = data['first_name'] ?? '';
        lastNameController.text = data['last_name'] ?? '';
        nationalIdController.text = data['national_id'] ?? '';
        emailController.text = data['email'] ?? '';
        contactNoController.text = data['contact_no'] ?? '';
        communityNameController.text = data['community_name'] ?? '';
        dobController.text = data['date_of_birth'] ?? '';

        print('First Name: ${firstNameController.text}');
        print('Last Name: ${lastNameController.text}');
        print('National ID: ${nationalIdController.text}');
        print('Email: ${emailController.text}');
        print('Contact No: ${contactNoController.text}');
        print('Community Name: ${communityNameController.text}');
        print('Date of Birth: ${dobController.text}');
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  _pickImageFromGallery() async {
    pickedFile =
        await _picker.pickImage(imageQuality: 50, source: ImageSource.gallery);
    print(pickedFile!.path);
    setState(() {});
  }

  void printChanges() {
    print('First Name: ${firstNameController.text}');
    print('Last Name: ${lastNameController.text}');
    print('National ID: ${nationalIdController.text}');
    print('Email: ${emailController.text}');
    print('Contact No: ${contactNoController.text}');
    print('Community Name: ${communityNameController.text}');
    print('Date of Birth: ${dobController.text}');
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Widget _buildSection(
    String title,
    List<String> fields,
    List<String> hintList,
  ) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.imagesEdit,
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Edit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < fields.length; i++)
              LabeledTextField(
                heading: fields[i],
                hintText: hintList.length > i ? hintList[i] : '',
                controller: i == 0
                    ? firstNameController
                    : i == 1
                        ? lastNameController
                        : i == 2
                            ? nationalIdController
                            : i == 3
                                ? emailController
                                : i == 4
                                    ? contactNoController
                                    : i == 5
                                        ? communityNameController
                                        : dobController,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            navigateToLogin();
          },
        ),
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              printChanges();
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImageFromGallery,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: pickedFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(pickedFile!.path),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Image.asset('assest/images/ownerIcon.png'),
                          ),
                          Image.asset(
                            Assets.imagesCameracom,
                            width: 43,
                            height: 43,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildSection(
                    "Personal Details",
                    [
                      "First Name",
                      "Last Name",
                      "National ID No",
                      "Email",
                      "Contact No",
                    ],
                    [
                      "Enter your first name",
                      "Enter your last name",
                      "Enter your national ID number",
                      "Enter your email",
                      "Enter your contact number",
                    ],
                  ),
                  _buildSection(
                    "Other Details",
                    [
                      "Community Name",
                      "Date of Birth",
                    ],
                    [
                      "Enter community name",
                      "Enter date of birth",
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
