import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/models/veiw_model.dart';
import 'package:tukiapp/views/admin_screens/widgets/labeled_textfield.dart';
import '../../../generated/assets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class EditProfileGuard extends StatefulWidget {
  const EditProfileGuard({Key? key}) : super(key: key);

  @override
  State<EditProfileGuard> createState() => _EditProfileGuardState();
}

class _EditProfileGuardState extends State<EditProfileGuard> {
  bool isLoading = false;
  ViewModel? user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Authorization': 'Bearer {{token}}',
      'Cookie':
          'auth_session=4cc3uvvoX4ljo4DfnGxfRxuVTGpPm95GizPDMt%2Fk5N5Uu2niaO2Om6EH4ie0DRBH07hSBr01ekoxS9LEJgMVW09MU3oOXNJCllWkextLGMoaLIpI2eeLGki5ZXz77ro0X%2BQrXj%2BhgpQ5xVvCg3z18Lh55V2uPSJOS8x610Kg3%2BeZyhabMj9mxz8j0BIXzmWYbIWVPTxw1OAS1d0%2B7O%2FewPexMsODEosH0hTWqTXSOrqRwGhU9eOp%2BtxtBrR%2F7R4JLBYCV4m148gMaZT%2BvmZ0yYqdegtCjNm1oSHMjgAS9a1XObtqsJLKMIdpbkNmW5TgkCVbvaXabLPkByOiYSOVGpDatX%2FIF84qNHKRCCpD0Jw%3D--O94zqABSDdidAeYg--O8y%2B3u20Uumyvp65IUNAww%3D%3D'
    };

    var uri =
        Uri.parse('https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/user');
    var request = http.Request('GET', uri);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await utf8.decodeStream(response.stream);
      final Map<String, dynamic> userData = json.decode(jsonResponse)['user'];
      user = ViewModel.fromJson(userData);

      print('User Data: $user');
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      isLoading = false;
    });
  }

  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;

  _pickImageFromGallery() async {
    pickedFile = await _picker.pickImage(
      imageQuality: 50,
      source: ImageSource.gallery,
    );
    print(pickedFile!.path);
    setState(() {});
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
                    style: bodyNormal.copyWith(fontWeight: FontWeight.bold),
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
                        style: bodySmall.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < fields.length; i++)
              if (fields[i] == "Date of Birth")
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  Colors.blue, // Head color of the calendar
                              onPrimary: Colors
                                  .white, // Color of the text in the calendar
                            ),
                            buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      print("Selected Date: $pickedDate");
                      // Here you can update the UI or save the selected date
                    }
                  },
                  child: LabeledTextField(
                    heading: fields[i],
                    hintText: hintList.length > i ? hintList[i] : '',
                    readOnly: true,
                  ),
                )
              else
                LabeledTextField(
                  heading: fields[i],
                  hintText: hintList.length > i ? hintList[i] : '',
                  readOnly: false, // Set readOnly to false for other fields
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
            Get.back();
          },
        ),
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: pickedFile != null
                          ? ClipOval(
                              child: Image.file(
                                File(pickedFile!.path),
                                fit: BoxFit.fill,
                              ),
                            )
                          : Image.asset(
                              'assest/images/name.png',
                              height: 13.h,
                            ),
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
            _buildSection(
              "Personal Details",
              [
                "First Name",
                "Last Name",
                "National ID No",
                "Email",
                "Contact No",
                "Date of Birth",
              ],
              [
                "Enter your first name",
                "Enter your last name",
                "Enter your national ID number",
                "Enter your email",
                "Enter your contact number",
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 5.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
              child: Align(
                child: Text(
                  "Save all changes",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
