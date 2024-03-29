import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';
import 'package:tukiapp/models/add_eventmodel.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/date_picker.dart';
// Import your other necessary files

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool loading = false;
  bool isLoading = false;
  AddEvent? add;
  int selected = -1; // Track selected category index
  File? _image;

  @override
  void initState() {
    postEventData();
    super.initState();
  }

  Future<void> postEventData() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Authorization': 'Bearer {{token}}',
      'Cookie':
          'auth_session=0Xyj9MVtapZwTRtVzYxBp%2FZoIhrTvGf9Uu2ZKpxM5uNqDWzPieq1Sz9Lha3ToazgQvmOUhQ4oPZ4iSdshAKSLus2i%2BR3MYt4Rt9074o6b2koFuxU22FWDL5NhjwFshJ5aQd3zWkwqIgcmRCygpup56qwGejqb56z8eaz%2FQCJkNPZekc7%2FkCuICvIZas6xUswdJ5XhdkyfFQILEe5Kc2VGmAtHjS3clN9zS2ffxEOMwwGOAxo0j7zMF938%2F4ppJpd9i7rBAyP2WC3hJIFZ3sI%2F9Tb6gCXW3E9WuISLD2t22B28X8TX209Ej46942sOL0Y%2BenObPd9x23I5NjsNqh0bf5qiFccpZOqGQpULuOD2XE%3D--E273l7vR31Gke36v--sDmn5xnKU80D%2Bkc0XHC2Iw%3D%3D'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/events'));
    request.fields.addAll({
      'event[name]': 'Event First',
      'event[description]': 'Description of first event.',
      'event[seats]': '20',
      'event[start_date]': '2024-09-09',
      'event[end_date]': '2024-09-12',
      'event[start_time]': '12:00',
      'event[end_time]': '14:00',
      'event[passes_attributes][][price]': '45',
      'event[passes_attributes][][valid_days]': '3',
      'event[passes_attributes][][price]': '30',
      'event[passes_attributes][][valid_days]': '2',
      'ticket[price]': '15'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  List<String> eventsCategory = ['Sports', 'BarBQ', 'Parties', 'Others'];
  List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String selectedDay = 'Mon';
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> eventsCategory = [
      {'name': 'Sports'},
      {'name': 'BarBQ'},
      {'name': 'Parties'},
      {'name': 'Others'},
    ];
    Future<void> _selectStartTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != startTime) {
        setState(() {
          startTime = pickedTime;
        });
      }
    }

    Future<void> _selectEndTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != endTime) {
        setState(() {
          endTime = pickedTime;
        });
      }
    }

    String _formatTime(TimeOfDay time) {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';
      return '$hours:$minutes $period';
    }

    Widget _buildSection(String title, Widget? child) {
      if (selected == 2) {
        if (title == 'Date') {
          return Container();
        } else if (title == 'Allocate Guard') {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              labeledWidget(
                'Select Party Organizer',
                CustomDropdown(
                  options: const [
                    "Party Planner 1",
                    "Party Planner 2",
                    "Party Planner 3",
                  ],
                  hint: '  Select',
                  onChanged: (String) {},
                ),
              ),
            ],
          );
        }
      }
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
          child: child,
        ),
      );
    }

    Widget _buildSectionParty(String title, Widget? child) {
      if (selected == 0) {
        if (title == 'Parties') {
        } else if (title == 'Allocate Guard') {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              labeledWidget(
                'Select Party Organizer',
                CustomDropdown(
                  options: const [
                    "Party Planner 1",
                    "Party Planner 2",
                    "Party Planner 3",
                  ],
                  hint: '  Select',
                  onChanged: (String) {},
                ),
              ),
            ],
          );
        }
      }
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
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: eventsCategory
                          .asMap()
                          .entries
                          .map(
                            (entry) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = entry.key;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 6,
                                ),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: entry.key != selected
                                      ? Colors.white
                                      : AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .sports_soccer, // Replace with your icon
                                      color: entry.key != selected
                                          ? AppColors.buttonColor
                                          : Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      entry.value['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: entry.key != selected
                                            ? AppColors.buttonColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Event Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const CustomTextField(
                        hintText: 'Tennis Court', fillColor: Color(0xFFF5F5F5)),
                  ),
                  _buildSection(
                    'Date',
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: labeledWidget(
                                'From',
                                SizedBox(
                                  height: 44,
                                  child: DatePickerWidget(
                                    onDateSelected: (d) {},
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: labeledWidget(
                                'To',
                                SizedBox(
                                  height: 44,
                                  child: DatePickerWidget(
                                    onDateSelected: (d) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: weekDays.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  selectedDay = weekDays[index];
                                  setState(() {});
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: selectedDay.contains(weekDays[index])
                                        ? Colors.grey.withOpacity(0.4)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      weekDays[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: labeledWidget(
                                "Start Time",
                                GestureDetector(
                                  onTap: () {
                                    _selectStartTime(context);
                                  },
                                  child: Container(
                                    height: 44,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.7),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: startTime != null
                                        ? Text(_formatTime(startTime!))
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('10:00 AM ')),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: labeledWidget(
                                'End Time',
                                GestureDetector(
                                  onTap: () {
                                    _selectEndTime(context);
                                  },
                                  child: Container(
                                    height: 44,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.7),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: endTime != null
                                        ? Text(_formatTime(endTime!))
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('11:00 AM')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                // PageTransition.pageNavigation(
                                //     page: const CreateEvent());
                              },
                              child: Container(
                                height: 3.h,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Add More +',
                                    style:
                                        bodyNormal.copyWith(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    '',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Charges",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const CustomTextField(
                            hintText: '\$200', fillColor: Color(0xFFF5F5F5)),
                        const SizedBox(height: 10),
                        Text(
                          "Description",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const CustomTextField(
                            maxLines: 6,
                            keyboardType: TextInputType.multiline,
                            hintText: "Write here",
                            fillColor: Color(0xFFF5F5F5)),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD0D5DD),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showImagePicker(context);
                            },
                            child: _image != null
                                ? Image.file(
                                    _image!,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.cloud_upload_outlined,
                                        color: Color(0xFF667085),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Upload Picture',
                                        style: TextStyle(
                                          color: const Color(0xFF667085),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  _buildSection(
                    'Allocate Guard',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Allocate Guard',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        labeledWidget(
                          'Select Guard',
                          CustomDropdown(
                            options: const [
                              "Black",
                              "Brown",
                              "Purple",
                              "Blue",
                              "Green/Black",
                              "Green",
                            ],
                            hint: '  Select',
                            onChanged: (String) {},
                          ),
                        ),
                        labeledWidget(
                          'Select Role',
                          CustomDropdown(
                            options: const [
                              "Black",
                              "Brown",
                              "Purple",
                              "Blue",
                              "Green/Black",
                              "Green",
                            ],
                            hint: '  Select',
                            onChanged: (String) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // PageTransition.pageNavigation(
                          //     page: const CreateEvent());
                        },
                        child: Container(
                          height: 3.h,
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Border width
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Add More Guard +',
                              style: bodyNormal.copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(onTap: () {}, buttonText: 'Save'),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget labeledWidget(heading, child) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 0,
      right: 0,
      bottom: 10.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        child,
      ],
    ),
  );
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String hint;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.options,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(hint),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.7,
          ),
        ),
      ),
    );
  }
}
