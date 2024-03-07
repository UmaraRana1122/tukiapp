import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/global_variables.dart';
import 'view_booking_details.dart';

class BookingListing extends StatefulWidget {
  const BookingListing({Key? key}) : super(key: key);

  @override
  State<BookingListing> createState() => _BookingListingState();
}

class _BookingListingState extends State<BookingListing> {
  List<String> bookingCategory = ['All', 'Complete', 'Cancelled', 'In Process'];
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "View All Bookings",
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
            ), // You can use any other icon you prefer
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bookingCategory
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
                                : Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: entry.key != selected
                                  ? Colors.black54
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ViewBookingDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.1), // Shadow color
                                spreadRadius: 5,
                                blurRadius: 10, // Offset of the shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booker",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.more_horiz_outlined,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: .7.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assest/images/ownerName.png",
                                          height: 7.h,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nelson Aston',
                                              style: bodyNormal,
                                            ),
                                            Text(
                                              'nelson@gmail.com',
                                              style: hintText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 3.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        color: Colors.green[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Paid",
                                        style: bodyNormal.copyWith(
                                            color: Colors.green),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
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
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Text(
                                  "Sample Restaurant",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "2 Seats Available",
                                      style: bodyNormal.copyWith(
                                          color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "\$200",
                                      style: bodyNormal.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Description Candle Light Dinner",
                                      style: bodyNormal.copyWith(
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Created :12-12-2023",
                                      style: bodyNormal.copyWith(
                                          color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "Expired :12-12-2023",
                                      style: bodyNormal.copyWith(
                                          color: Colors.red[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Time: 10pm to 12am",
                                      style: bodyNormal.copyWith(
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
