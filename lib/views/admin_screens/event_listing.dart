import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import '../../models/admin_dashboard_model.dart';
import 'create_event.dart';

class EventListing extends StatefulWidget {
  final AdminDashBoardModel? eventData;
  const EventListing({Key? key, required this.eventData}) : super(key: key);

  @override
  State<EventListing> createState() => _EventListingState();
}



class _EventListingState extends State<EventListing> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Events",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
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
      body: 
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Current Events",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(page: const CreateEvent());
                    },
                    child: Container(
                      height: 4.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add Event +',
                          style: bodyNormal.copyWith(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.eventData?.events.length ?? 0,
                itemBuilder: (c, i) {
                  if (widget.eventData == null) {
                    return SizedBox.shrink();
                  }
                  final event = widget.eventData!.events[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40.h,
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
                              width: 80.w,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Text(
                              event.name.toString(),
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${event.seats} Seats Available",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "\$" + event.ticket!.price.toString(),
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  event.description.toString(),
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Created :${DateFormat("dd-MM-yyyy").format(event.startDate)}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "Expired :${DateFormat("dd-MM-yyyy").format(event.endDate)}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.red[700]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${"Time: " + event.startTime.toString()} to " +
                                      event.endTime.toString(),
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
