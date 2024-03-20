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
      body: FutureBuilder<void>(
        future: _adminController.getAdminDashBoard(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        child: Text(
                                      _adminController.adminDashBoard!.owners
                                              .toString(), // Use null check operator and provide a default value
                                    )),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        child: Text(
                                      _adminController.adminDashBoard!.bookings
                                              .toString() ??
                                          '0', // Use null check operator and provide a default value
                                    )),
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
                      // Rest of your code...
                    ],
                  ),
                ));
          }
        },
      ),
    );
  }
}
