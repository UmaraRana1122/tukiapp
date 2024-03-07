import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_widget.dart';

import '../../constants/global_variables.dart';
import '../../widgets/date_picker.dart';
import 'widgets/labeled_textfield.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  List<String> eventsCategory = ['Sports', 'BarBQ', 'Parties', 'Others'];
  List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String selectedDay = 'Mon';
  int selected = -1;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Widget _buildSection(String title, Widget? child) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: eventsCategory
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                      onTap: () {
                        setState(() => selected = entry.key);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: entry.key != selected
                              ? Colors.white
                              : AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.buttonColor,
                          ),
                        ),
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: entry.key != selected
                                ? AppColors.buttonColor
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
                    child: Expanded(
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
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                              ))),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 0.7),
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
                              style: bodyNormal.copyWith(color: Colors.blue),
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
              labeledWidget(
                'Expiry Date',
                SizedBox(
                  height: 44,
                  child: DatePickerWidget(
                    onDateSelected: (d) {},
                  ),
                ),
              ),
            ),
            _buildSection(
              '',
              Column(
                children: [
                  labeledWidget(
                    'Charges',
                    const CustomTextField(hintText: '\$200'),
                  ),
                  labeledWidget(
                    'Description',
                    const CustomTextField(
                      hintText: 'Write here',
                      maxLines: 4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D5DD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          color: Color(0xFF667085),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Upload Picture',
                          style: bodyNormal.copyWith(
                              color: const Color(0xFF667085)),
                        )
                      ],
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
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
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
