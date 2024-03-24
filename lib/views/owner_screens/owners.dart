import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/controllers/admin_controller.dart';
import 'package:tukiapp/generated/assets.dart';
import 'package:tukiapp/views/admin_screens/co_owner_details.dart';
import 'package:tukiapp/views/admin_screens/event_listing.dart';
import 'package:tukiapp/views/admin_screens/owner_details.dart';
import 'package:tukiapp/views/admin_screens/tenant_details.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/expense_alert.dart';
import 'package:tukiapp/widgets/expenses_history.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import '../../widgets/custom_widget.dart';
import '../guards_screens/guard_report.dart';

class Owners extends StatefulWidget {
  const Owners({Key? key}) : super(key: key);

  @override
  State<Owners> createState() => _OwnersState();
}

class _OwnersState extends State<Owners> {
  final AdminController _adminController = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Owners",
          style: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Owners List",
                    style: bodyNormal.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: EventListing(
                        eventData: _adminController.adminDashBoard!,
                      ));
                    },
                    child: Container(
                      height: 3.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff00A3FF)),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Align(
                        child: Text(
                          "Add Owner +",
                          style: TextStyle(
                              color: Color(0xff00A3FF),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
                                  builder: ((context) =>
                                      DraggableScrollableSheet(
                                          maxChildSize: 0.50,
                                          minChildSize: 0.3,
                                          initialChildSize: 0.40,
                                          builder: (context,
                                              ScrollController scroll) {
                                            return ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(25),
                                              ),
                                              child: Container(
                                                color: Color(0xffFFFFFF),
                                                child: StatefulBuilder(builder:
                                                    (context, innerstate) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Icon(Icons
                                                                  .arrow_back_ios_new),
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Text(
                                                              "Filter",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          ],
                                                        ),
                                                        Divider(),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
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
                                                            onChanged:
                                                                (String) {},
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
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
                                                            onChanged:
                                                                (String) {},
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(() =>
                                                                GuardReport());
                                                          },
                                                          child: Container(
                                                            height: 5.h,
                                                            width: 100.w,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff00A3FF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Align(
                                                              child: Text(
                                                                "Search",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          })));
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
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100.w,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assest/images/ownerName.png",
                                    height: 6.h,
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert),
                                // 3-dots icon
                                onSelected: (value) {
                                  // Handle the selected value
                                  if (value == "Option 1") {
                                    PageTransition.pageNavigation(
                                        page: const OwnerDetails());
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    const PopupMenuItem<String>(
                                      value: 'Option 1',
                                      child: Text('Eliminate Account'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'Option 2',
                                      child: Text('Send Warning'),
                                    ),
                                  ];
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                alertPOP6(context);
                              },
                              child: Container(
                                height: 4.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffd0efff),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Align(
                                        child: Text(
                                          "Common Expenses History",
                                          style: TextStyle(
                                              color: Color(0xff38AEEF),
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xff38AEEF),
                                        size: 2.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 4.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Color(0xfff9dfe2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Warning History",
                                        style: TextStyle(
                                            color: Color(0xffff0000),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xffff0000),
                                      size: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apartment No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "000000000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Tenants & Co Owners",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "04",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100.w,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assest/images/ownerName.png",
                                    height: 6.h,
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert),
                                // 3-dots icon
                                onSelected: (value) {
                                  // Handle the selected value
                                  if (value == "Option 1") {
                                    PageTransition.pageNavigation(
                                        page: const OwnerDetails());
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    const PopupMenuItem<String>(
                                      value: 'Option 1',
                                      child: Text('Eliminate Account'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'Option 2',
                                      child: Text('Send Warning'),
                                    ),
                                  ];
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 4.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffd0efff),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Align(
                                      child: Text(
                                        "Common Expenses History",
                                        style: TextStyle(
                                            color: Color(0xff38AEEF),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xff38AEEF),
                                      size: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 4.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Color(0xfff9dfe2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Warning History",
                                        style: TextStyle(
                                            color: Color(0xffff0000),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xffff0000),
                                      size: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apartment No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "000000000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Tenants & Co Owners",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "04",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100.w,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assest/images/ownerName.png",
                                    height: 6.h,
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
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert),
                                // 3-dots icon
                                onSelected: (value) {
                                  // Handle the selected value
                                  if (value == "Option 1") {
                                    PageTransition.pageNavigation(
                                        page: const OwnerDetails());
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    const PopupMenuItem<String>(
                                      value: 'Option 1',
                                      child: Text('Eliminate Account'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'Option 2',
                                      child: Text('Send Warning'),
                                    ),
                                  ];
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 4.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffd0efff),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Align(
                                      child: Text(
                                        "Common Expenses History",
                                        style: TextStyle(
                                            color: Color(0xff38AEEF),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xff38AEEF),
                                      size: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 4.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Color(0xfff9dfe2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Warning History",
                                        style: TextStyle(
                                            color: Color(0xffff0000),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xffff0000),
                                      size: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apartment No:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "000000000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Licence plate:",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "#0000000",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Tenants & Co Owners",
                              style:
                                  bodyNormal.copyWith(color: Colors.grey[700]),
                            ),
                            Text(
                              "04",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
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
