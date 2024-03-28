import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/models/veiw_model.dart';
import 'package:tukiapp/splash_page.dart';
import 'package:tukiapp/widgets/create_alert.dart';
import 'package:tukiapp/widgets/expense_alert.dart';
import '../../constants/global_variables.dart';
import '../../generated/assets.dart';
import 'widgets/drawer_list_tile.dart';

import '../../constants/custom_navigation.dart';
import '../../controllers/admin_controller.dart';
import 'auth_screens/edit_profile.dart';
import '../bookings/booking_listing.dart';
import 'create_event.dart';
import 'create_guard.dart';
import 'create_owner.dart';
import 'event_listing.dart';
import 'guard_listing.dart';
import 'owners_listing.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final AdminController _adminController = Get.find<AdminController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool loading = false;
  bool isLoading = false;
  ViewModel? user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Authorization': 'Bearer {{token}}',
      'Cookie':
          'auth_session=PBSVxW%2B5zYKY6Rl2dvLQRp3eU%2F6oaoylmcGocc7nSKE1ENXgDIhOEzUwqVO3bvPGZewnr2dPSq6wdVbmQ4ucjRanz32zytqAoNNIHUsPmCOxlifC6XrBrdrHxCA426CXEnyhda%2BZAfFJHOCDU9yzS9B3020twp2RZslgEWZ7rOcYgvnD%2BNRXIUcewSUopeiou%2BxD3bAhqnyU9na8kw6758uLE1U%2Bz1nx3dJUXffXsfKrQnQsJj4vcHHqcCayVVTfPL2%2Fe96grpKWi0AjPoKFy5XVXNHxyk1us%2Bx%2Bz%2BX%2BP3PME6V6ppqpwx%2FhFkTtQ%2Fn2qRhY%2Bnq1rodEIKkutx7c%2Fj7H2lMhIBSX4yoMG5h8QUQ%3D--ZmsnBqdaKP4fPz6y--GkfSbW5NcCxFryRvlooRhA%3D%3D'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/admin/dashboard'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await utf8.decodeStream(response.stream);
      print(
          'API Response: $jsonResponse'); // Print the entire API response for debugging
      final Map<String, dynamic>? userData = json.decode(jsonResponse)['user'];
      if (userData != null) {
        user = ViewModel.fromJson(userData);
        print('User Data: $user');
      } else {
        print('User data is null');
      }
    } else {
      print(
          'HTTP Error: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          "Dashboard (Community 1)",
          style: bodyNormal,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      _adminController.adminDashBoard?.owners
                                              ?.toString() ??
                                          '',
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Owners",
                                      style: bodySmall,
                                    ),
                                  ),
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
                                    color: Colors.white,
                                  ),
                                  child: const Center(child: Text("0")),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Guards",
                                      style: bodySmall,
                                    ),
                                  ),
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
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      _adminController.adminDashBoard?.bookings
                                              ?.toString() ??
                                          '',
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "Bookings",
                                      style: bodySmall,
                                    ),
                                  ),
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
                                      eventData:
                                          _adminController.adminDashBoard!));
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
                                ),
                              ),
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
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dinner",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Icon(
                                      Icons.more_horiz_rounded,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )),
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
                              _adminController.adminDashBoard?.events[0].name ??
                                  '',
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
                                  "${_adminController.adminDashBoard?.events[0].seats} Seats Available",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "\$${_adminController.adminDashBoard?.events[0].ticket.price}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.black,
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
                                    _adminController.adminDashBoard?.events[0]
                                            .description ??
                                        '',
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
                                  "Created :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard?.events[0].startDate ?? DateTime.now())}",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  "Expired :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard?.events[0].endDate ?? DateTime.now())}",
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
                                  "${"Time: ${_adminController.adminDashBoard?.events[0].startTime}"} to ${_adminController.adminDashBoard?.events[0].endTime ?? ''}",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          PageTransition.pageNavigation(
                              page: const CreateEvent());
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Add New Events +',
                              style: bodyNormal.copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          PageTransition.pageNavigation(page: CreateOwner());
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff57009b26),
                            border: Border.all(
                              color: const Color(0xffc7c6c6ff),
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
                                        'Create Owner',
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
                              color: const Color(0xffc7c6c6ff),
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
                                        'Create Guards Profile',
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
                              color: const Color(0xffc7c6c6ff),
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
                                        'Create Alerts',
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
                          alertPOP4(context);
                        },
                        child: Container(
                          height: 5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffe8f3f5),
                            border: Border.all(
                              color: const Color(0xffc7c6c6ff),
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
                                        'Common Expenses',
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
