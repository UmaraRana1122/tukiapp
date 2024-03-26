import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/splash_page.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/edit_profile.dart';
import 'package:tukiapp/views/admin_screens/create_guard.dart';
import 'package:tukiapp/views/admin_screens/event_listing.dart';
import 'package:tukiapp/views/admin_screens/guard_listing.dart';
import 'package:tukiapp/views/admin_screens/owners_listing.dart';
import 'package:tukiapp/views/admin_screens/widgets/drawer_list_tile.dart';
import 'package:tukiapp/views/owner_screens/co_owner.dart';
import 'package:tukiapp/widgets/create_alert.dart';
import '../../constants/global_variables.dart';
import '../../generated/assets.dart';

import '../../constants/custom_navigation.dart';
import '../../controllers/admin_controller.dart';
import '../bookings/booking_listing.dart';

class NeslonDashboard extends StatefulWidget {
  const NeslonDashboard({Key? key}) : super(key: key);

  @override
  State<NeslonDashboard> createState() => _NeslonDashboardState();
}

class _NeslonDashboardState extends State<NeslonDashboard> {
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
          "Neslon Aston (Owner)",
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
                            width: 30.w,
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
                                          .adminDashBoard!.owners
                                          .toString())),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "Owners",
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
                                page: const GuardListing());
                          },
                          child: Container(
                            height: 6.h,
                            width: 30.w,
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
                                  child: const Center(child: Text("0")),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "Guards",
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
                            width: 30.w,
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
                                          .adminDashBoard!.bookings
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
                            "Current Events",
                            style: title.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              PageTransition.pageNavigation(
                                  page: EventListing(
                                eventData: _adminController.adminDashBoard!,
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
                      height: 40.h,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.grey,
                              ),
                            ),
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
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              _adminController.adminDashBoard!.events[0].name
                                  .toString(),
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
                                  "${_adminController.adminDashBoard!.events[0].seats} Seats Available",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "\$${_adminController.adminDashBoard!.events[0].ticket.price}",
                                  style: bodyNormal.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0, right: 18.0),
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
                                SizedBox(
                                  width: 80.w,
                                  child: Text(
                                    _adminController
                                        .adminDashBoard!.events[0].description
                                        .toString(),
                                    maxLines: 1,
                                    style: bodyNormal.copyWith(
                                        color: Colors.grey[700]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0, right: 18.0),
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
                                  "Created :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard!.events[0].startDate)}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "Expired :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard!.events[0].endDate)}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.red[700]),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0, right: 18.0),
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
                                  "${"Time: ${_adminController.adminDashBoard!.events[0].startTime}"} to ${_adminController.adminDashBoard!.events[0].endTime}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
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

                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          PageTransition.pageNavigation(
                              page: const CreateCoOwner());
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff57009b26),
                            border: Border.all(
                              color: const Color(0xffc7c6c6ff), // Border width
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assest/images/ownerIcon.png",
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        'Create Co Owner',
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          PageTransition.pageNavigation(
                              page: const CreateGuard());
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xfffaf5cc),
                            border: Border.all(
                              color: const Color(0xffc7c6c6ff), // Border width
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assest/images/guardIcon.png",
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        'Create Talent',
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          alertPOP5(context);
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffa5b2ec),
                            border: Border.all(
                              color: const Color(0xffc7c6c6ff), // Border width
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assest/images/alertIcon.png",
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        'Create Guest Invitation',
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
