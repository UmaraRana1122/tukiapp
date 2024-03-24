import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:tukiapp/models/events_model.dart';
import 'package:tukiapp/models/upcoming_events.dart';

import '../../constants/global_variables.dart';

class UpcomingEvent extends StatefulWidget {
  const UpcomingEvent({Key? key}) : super(key: key);

  @override
  State<UpcomingEvent> createState() => _UpcomingEventState();
}

class _UpcomingEventState extends State<UpcomingEvent> {
  bool isLoading = false;
  UpcomingEventsModel? event;

  @override
  void initState() {
    fetchUpcomingEvents();
    super.initState();
  }

  Future<void> fetchUpcomingEvents() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Authorization': 'Bearer {{token}}',
      'Cookie': 'auth_session=YOUR_AUTH_SESSION_COOKIE',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/events/upcoming'),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      setState(() {
        event = upcomingEventsModelFromJson(responseBody);
      });
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Events",
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
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : event == null || event!.events == null || event!.events!.isEmpty
                ? Center(
                    child: Text("No upcoming events"),
                  )
                : ListView.builder(
                    itemCount: event!.events!.length,
                    itemBuilder: (context, index) {
                      var currentEvent = event!.events![index];
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  "assest/images/eventImage.png",
                                  width: 85.w,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              _buildEventInfo(
                                title: currentEvent.name ?? "",
                                subtitle:
                                    "Expiry Date: ${currentEvent.endDate?.toString() ?? ""}",
                              ),
                              _buildDivider(),
                              SizedBox(height: 1.h),
                              _buildEventInfo(
                                title:
                                    "Guests Invited: ${currentEvent.seats ?? 0}",
                                subtitle: "Scan QR",
                                isSubtitleUnderlined: true,
                              ),
                              _buildDivider(),
                              SizedBox(height: 1.h),
                              _buildEventInfo(
                                title:
                                    'Event Start Date: ${currentEvent.startDate?.toString() ?? ""}',
                                subtitle:
                                    "Time: ${currentEvent.timeSlots?.isNotEmpty ?? false ? currentEvent.timeSlots![0].toString() : ""}",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  Widget _buildEventInfo({
    required String title,
    required String subtitle,
    bool isSubtitleUnderlined = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            subtitle,
            style: TextStyle(
              color: isSubtitleUnderlined ? Colors.blue[700] : Colors.grey[700],
              decoration: isSubtitleUnderlined
                  ? TextDecoration.underline
                  : TextDecoration.none,
              fontWeight:
                  isSubtitleUnderlined ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Divider(),
    );
  }
}
