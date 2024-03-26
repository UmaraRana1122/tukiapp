import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'qr_screen.dart';
import 'upcoming_event.dart';
import 'validate_person.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          "Guard Dashboard",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ), // You can use any other icon you prefer
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow[900],
          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assest/images/NA.png",
                    height: 7.h,
                  ),
                  Text(
                    "Nelson Aston",
                    style: bodyNormal.copyWith(fontSize: 18),
                  ),
                  Text(
                    "nelsonaston@gmail.com",
                    style: bodyNormal.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/11.png",
                height: 4.5.h,
              ),
              title: const Text("My Profile"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/12.png",
                height: 4.5.h,
              ),
              title: const Text('Notifications'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/12.png",
                height: 4.5.h,
              ),
              title: const Text('Guard Report'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/13.png",
                height: 4.5.h,
              ),
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/14.png",
                height: 4.5.h,
              ),
              title: const Text('About Community Rules'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/15.png",
                height: 4.5.h,
              ),
              title: const Text('Share App'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/17.png",
                height: 4.5.h,
              ),
              title: const Text('Rate App'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assest/images/16.png",
                height: 4.5.h,
              ),
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const UpcomingEvent());
                    },
                    child: Container(
                      height: 6.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff57009b26),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 3.h,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Replace with your desired color
                            ),
                            child: const Center(child: Text("38")),
                          ),
                          Container(
                            child: Center(
                                child: Text(
                              "Upcoming Events",
                              style: bodySmall,
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const ValidatePerson());
                    },
                    child: Container(
                      height: 6.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff57009b26),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 3.h,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Replace with your desired color
                            ),
                            child: const Center(child: Text("05")),
                          ),
                          Container(
                            child: Center(
                                child: Text(
                              "Validate Persons",
                              style: bodySmall,
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add Notes",
                      style: title.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 100.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 5,
                        blurRadius: 10, // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Events",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 25.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tennis Court",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assest/images/club.png",
                                    width: 80.w,
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Guest:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                    Text(
                                      "02",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp),
                                    ),
                                    Spacer(),
                                    Text(
                                      "View Details",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontSize: 11.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 25.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dance Party",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assest/images/party.png",
                                    width: 80.w,
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Guest:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                    Text(
                                      "250",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp),
                                    ),
                                    Spacer(),
                                    Text(
                                      "View Details",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontSize: 11.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 25.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tennis Court",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assest/images/club.png",
                                    width: 80.w,
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Guest:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                    Text(
                                      "02",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp),
                                    ),
                                    Spacer(),
                                    Text(
                                      "View Details",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          fontSize: 11.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    PageTransition.pageNavigation(page: const QRScreen());
                  },
                  child: Container(
                    height: 5.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffBCD0F3),
                      border: Border.all(
                        color: const Color(0xffBCD0F3), // Border width
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assest/images/qrIcon.png",
                                  height: 3.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  'Scan QR With Verification',
                                  style: bodyNormal,
                                ),
                              ],
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
