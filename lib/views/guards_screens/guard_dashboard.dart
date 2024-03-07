import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'qr_screen.dart';
import 'upcoming_event.dart';
import 'validate_person.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_widget.dart';

class GuardDashboard extends StatefulWidget {
  const GuardDashboard({Key? key}) : super(key: key);

  @override
  State<GuardDashboard> createState() => _GuardDashboardState();
}

class _GuardDashboardState extends State<GuardDashboard> {
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
              Container(
                height: 53.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 5,
                      blurRadius: 10, // Offset of the shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Publish With",
                        style: bodyNormal.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 10.0),
                      child: CustomDropdown(
                        options: const [
                          "Black",
                          "Brown",
                          "Purple",
                          "Blue",
                          "Green/Black",
                          "Green",
                        ],
                        hint: '     Validate People',
                        onChanged: (String) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 10.0),
                      child: CustomTextField(
                        // controller: emailEditingController,
                        validator: (value) => CustomValidator.email(value),
                        hintText: "Subject",
                        // prefixIcon: AppImages.emailIcon,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 10.0),
                      child: Container(
                        height: 20.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey, // Make the border transparent
                              width: 1,
                            )),
                        child: SingleChildScrollView(
                          child: TextFormField(
                            // controller: noteController,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.none,
                            maxLines: null,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            cursorColor: AppColors.primaryColor,
                            style: const TextStyle(fontSize: 17),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              border: InputBorder.none,
                              hintText: "Enter complete message here",
                              hintStyle:
                                  bodyNormal.copyWith(color: Colors.black54),
                              prefixIconColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: CustomButton(
                        buttonText: "Submit",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
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
                                  'Scan QR',
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
//  Container(
//                       height: 40.h,
//                       width: 90.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color:
//                                 Colors.black.withOpacity(0.1), // Shadow color
//                             spreadRadius: 5,
//                             blurRadius: 10, // Offset of the shadow
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 18),
//                               child: Icon(
//                                 Icons.more_horiz_rounded,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Center(
//                             child: Image.asset(
//                               "assest/images/eventImage.png",
//                               width: 80.w,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 18.0),
//                             child: Text(
//                               _adminController.adminDashBoard.events[0].name
//                                   .toString(),
//                               style: bodyNormal.copyWith(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "${_adminController.adminDashBoard.events[0].seats} Seats Available",
//                                   style: bodyNormal.copyWith(
//                                       color: Colors.grey[700]),
//                                 ),
//                                 Text(
//                                   "\$${_adminController.adminDashBoard.events[0].ticket.price}",
//                                   style: bodyNormal.copyWith(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Divider(),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 80.w,
//                                   child: Text(
//                                     _adminController
//                                         .adminDashBoard.events[0].description
//                                         .toString(),
//                                     maxLines: 1,
//                                     style: bodyNormal.copyWith(
//                                         color: Colors.grey[700]),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Divider(),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Created :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard.events[0].startDate)}",
//                                   style: bodyNormal.copyWith(
//                                       color: Colors.grey[700]),
//                                 ),
//                                 Text(
//                                   "Expired :${DateFormat("dd-MM-yyyy").format(_adminController.adminDashBoard.events[0].endDate)}",
//                                   style: bodyNormal.copyWith(
//                                       color: Colors.red[700]),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Divider(),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 18.0, right: 18.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "${"Time: ${_adminController.adminDashBoard.events[0].startTime}"} to ${_adminController.adminDashBoard.events[0].endTime}",
//                                   style: bodyNormal.copyWith(
//                                       color: Colors.grey[700]),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),