import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/generated/assets.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';

import 'guard_report.dart';
import 'tennis_detail.dart';

class AllEvent extends StatefulWidget {
  const AllEvent({Key? key}) : super(key: key);

  @override
  State<AllEvent> createState() => _AllEventEventState();
}

class _AllEventEventState extends State<AllEvent> {
  final List<String> eventsCategory = ['All', 'Sports', 'Parties', 'Gym'];
  final List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
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
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: child,
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
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
          "Add Events",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Search id',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: ((context) => DraggableScrollableSheet(
                                maxChildSize: 0.50,
                                minChildSize: 0.3,
                                initialChildSize: 0.40,
                                builder: (context, ScrollController scroll) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    child: Container(
                                      color: Color(0xffFFFFFF),
                                      child: StatefulBuilder(
                                        builder: (context, innerState) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 20,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Icon(Icons.arrow_back_ios_new),
                                                    ),
                                                    SizedBox(width: 3.w),
                                                    Text(
                                                      "Filter",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Divider(),
                                                SizedBox(height: 2.h),
                                                labeledWidget(
                                                  ' Sort By Apartment',
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
                                                SizedBox(height: 2.h),
                                                labeledWidget(
                                                  'Sort By License Plate',
                                                  CustomDropdown(
                                                    options: const [
                                                      "Paid",
                                                      "Pending",
                                                      "In Process",
                                                      "Completed",
                                                    ],
                                                    hint: '  #oooooo',
                                                    onChanged: (String) {},
                                                  ),
                                                ),
                                                SizedBox(height: 2.h),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(() => GuardReport());
                                                  },
                                                  child: Container(
                                                    height: 5.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff00A3FF),
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Align(
                                                      child: Text(
                                                        "Search",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              )),
                            );
                          },
                          child: Image.asset(
                            Assets.imagesFilter,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventCard(
                    title: "Tennis Court",
                    image: "assest/images/club.png",
                    description: "(\$200)",
                    details: "2 Allocated",
                    onPressed: () => Get.to(TenisDetail()),
                  ),
                  SizedBox(height: 2.h),
                  _buildEventCard(
                    title: "Dance Party",
                    image: "assest/images/party.png",
                    description: "",
                    details: "Guest: 250",
                    onPressed: () {},
                  ),
                  SizedBox(height: 2.h),
                  _buildEventCard(
                    title: "Tennis Court",
                    image: "assest/images/club.png",
                    description: "",
                    details: "Guest: 02",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String image,
    required String description,
    required String details,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 25.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.sp,
                    ),
                  ),
                Spacer(),
                Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(height: 1.h),
            Center(
              child: Image.asset(
                image,
                width: 80.w,
              ),
            ),
            Divider(),
            SizedBox(height: 1.h),
            Row(
              children: [
                Text(
                  "Guards:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: onPressed,
                  child: Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
}

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String? hint;
  final void Function(String?)? onChanged;

  const CustomDropdown({
    required this.options,
    this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
      ),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
