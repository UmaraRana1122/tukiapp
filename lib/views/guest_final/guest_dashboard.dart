import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/splash_page.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/edit_profile.dart';
import 'package:tukiapp/views/admin_screens/create_event.dart';
import 'package:tukiapp/views/admin_screens/create_guard.dart';
import 'package:tukiapp/views/admin_screens/create_owner.dart';
import 'package:tukiapp/views/admin_screens/event_listing.dart';
import 'package:tukiapp/views/admin_screens/guard_listing.dart';
import 'package:tukiapp/views/admin_screens/owners_listing.dart';
import 'package:tukiapp/views/admin_screens/widgets/custom_alert.dart';
import 'package:tukiapp/views/admin_screens/widgets/drawer_list_tile.dart';
import 'package:tukiapp/widgets/create_alert.dart';
import 'package:tukiapp/widgets/expense_alert.dart';
import '../../constants/global_variables.dart';
import '../../generated/assets.dart';

import '../../constants/custom_navigation.dart';
import '../../controllers/admin_controller.dart';
import '../bookings/booking_listing.dart';

class GuestDashboard extends StatefulWidget {
  const GuestDashboard({Key? key}) : super(key: key);

  @override
  State<GuestDashboard> createState() => _GuestDashboardState();
}

class _GuestDashboardState extends State<GuestDashboard> {
  final AdminController _adminController = Get.find<AdminController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool loading = false;

  getData() async {
    setState(() {
      loading = true;
    });
    await _adminController.getAdminDashBoard(context);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          "Nelson Aston (Guest)",
          style: bodyNormal,
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assest/images/ownerName.png",
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
            CustomListTile(
                icon: Icons.person,
                title: 'My Profile',
                onTap: () {
                  Get.to(() => const EditProfile());
                }),
            CustomListTile(
                icon: Icons.notifications, title: 'Notification', onTap: () {}),
            CustomListTile(
                icon: Icons.notifications,
                title: 'Guard Reports',
                onTap: () {}),
            CustomListTile(
                icon: Icons.settings, title: 'Settings', onTap: () {}),
            CustomListTile(
                iconAsset: Assets.imagesAbout,
                title: 'About Community Rules',
                onTap: () {}),
            CustomListTile(icon: Icons.share, title: 'Share App', onTap: () {}),
            CustomListTile(
                iconAsset: Assets.imagesRate, title: 'Rate App', onTap: () {}),
            CustomListTile(
                iconAsset: Assets.imagesLogout,
                title: 'Logout',
                onTap: () {
                  Get.offAll(() => const SplashScreen());
                }),
          ],
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : Padding(
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
                                page: const OwnerListing());
                          },
                          child: Container(
                            height: 6.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff57009b26),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
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
                                  child: Center(
                                      child: Text(_adminController
                                          .adminDashBoard.owners
                                          .toString())),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "Your Invitations",
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
                                page: const BookingListing());
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
                                  child: Center(
                                      child: Text(_adminController
                                          .adminDashBoard.bookings
                                          .toString())),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "Bookings",
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming Events",
                            style: title.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              PageTransition.pageNavigation(
                                  page: EventListing(
                                eventData: _adminController.adminDashBoard,
                              ));
                            },
                            child: Container(
                              height: 3.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                  child: Text(
                                "View All",
                                style: bodyNormal,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      height: 33.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            spreadRadius: 5,
                            blurRadius: 10, // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2.h,
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
                            Row(
                              children: [
                                Text(
                                  "Sample Resturent",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text(
                                  "\$200",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "2 Seats Available",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  "- 10pm to 12am",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Description Candle Light Dinner Description Candle Light DinnerDescription Candle Light Dinner...",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Expiry Date: 14-12-2023",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red),
                                ),
                                Spacer(),
                                Text(
                                  "",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.keyboard_double_arrow_left_sharp),
                          Text("Previous",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600)),
                          Spacer(),
                          Text("Next",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600)),
                          Icon(Icons.keyboard_double_arrow_right_sharp),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Invitations",
                            style: bodyNormal.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F9FF),
                          border: Border.all(
                            color: const Color(0xffc6c6ff), // Border width
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invited By:",
                                style: bodyNormal.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assest/images/ownerName.png",
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nelson Aston",
                                        style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                        "nelson@gmail.com",
                                        style: bodyNormal.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 10.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Your Ticket",
                                style: bodyNormal.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 15.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "ID#111111332",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Sample Restaurant will come here",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "10pm to 12am",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "From(11:00 PM)  To (12:00 AM)",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Exp Date : 14-12-2023",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        "assest/images/barcode.png",
                                        height: 13.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "<-Previous",
                    //         style: bodyNormal,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Next->",
                    //         style: bodyNormal,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
