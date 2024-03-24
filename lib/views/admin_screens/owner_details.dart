import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/models/apartment_model.dart';
import 'package:tukiapp/models/owner_model.dart';
import 'tenant_details.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import 'co_owner_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OwnerDetails extends StatefulWidget {
  final OwnerModel? owner;

  const OwnerDetails({Key? key, this.owner}) : super(key: key);

  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  bool loading = false;
  bool isLoading = false;
  ApartmentModel? apartment;

  @override
  void initState() {
    getApartmentData();
    super.initState();
  }

  Future<void> getApartmentData() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Authorization': 'Bearer <token>',
      'Cookie':
          'auth_session=UMBYMIkdVwqQCPPqgEckzi7xTKaKp5cBiTthoCBaHkUzmqwQCKOkB1b9CFUkY0eulYfAju88t97Tijo0FklipQ9NkUCt%2F%2FY4RsYBPcGZkKSj7ZEDkWMX8ilbIbnzRLLOo2uYMuDyoOTjiDZ69FJpCgqgxoVUglgx0orq37wVR6mTVpQcIaoMEGYadmYeiIqbUDRRBbZ0gQ4rIYBI5OmCMVCFJXZ5Vf2097eBvlfxfGeBPxOdF9zB02vtMFyReLa4Cm9sGMe8qcWKst1qnnOoeoYglk3szfWo%2FKTobBvgEiW6bv3XRJtCvh164ft%2Fjj4aRRnvno28FZ5H6dkGfAW2BqCCNrBfcM%2BKMteeTLbz2Y4%3D--FwrSzzcYnP0IplU4--j7RppB6DN4h5Vk%2FoJRRzlg%3D%3D'
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/apartments'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Decode the response
      var jsonResponse = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(jsonResponse);

      // Parse the decoded response into ApartmentModel
      apartment = ApartmentModel.fromJson(decodedResponse);

      // Now you have the apartment data in the 'apartment' variable
      print('Apartment ID: ${apartment!.id}');
      print('Apartment Name: ${apartment!.number}');
      print('Apartment Location: ${apartment!.community!.name}');
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
          "Owner Details",
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "View Details",
                        style: bodyNormal.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
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
                            if (widget.owner != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${widget.owner!.account?.firstName ?? ''} ${widget.owner!.account?.lastName ?? ''}',
                                    style: bodyNormal,
                                  ),
                                  Text(
                                    'Email: ${widget.owner!.account?.email ?? ''}',
                                    style: hintText,
                                  ),
                                ],
                              )
                            else
                              Center(
                                child: Text('No owner details available'),
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
                              "Other details",
                              style: bodyNormal.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Licence plate:",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  apartment != null
                                      ? apartment!.licensePlate ?? 'N/A'
                                      : 'N/A',
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
                                  "Building Name:",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  apartment != null
                                      ? apartment!.community?.name ?? 'N/A'
                                      : 'N/A',
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
                                  "Date of Birth:",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  widget.owner?.account?.birthdate != null
                                      ? widget.owner!.account!.birthdate!
                                          .toString()
                                      : 'N/A',
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
                                  "National Id:",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  widget.owner?.account?.nationalId ?? 'N/A',
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
                                  "Contact No:",
                                  style: bodyNormal.copyWith(
                                      color: Colors.grey[700]),
                                ),
                                Text(
                                  widget.owner?.account?.contact ?? 'N/A',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Co Owners added by Owner",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (c, i) {
                        return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 18.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffF2F9FF),
                                border: Border.all(
                                  color:
                                      const Color(0xffc6c6ff), // Border width
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Row(
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
                                      PopupMenuButton<String>(
                                        icon: const Icon(Icons.more_vert),
                                        // 3-dots icon
                                        onSelected: (value) {
                                          // Handle the selected value
                                          if (value == "Option 1") {
                                            PageTransition.pageNavigation(
                                                page: const CoOwnerDetails());
                                          }
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            const PopupMenuItem<String>(
                                              value: 'Option 1',
                                              child: Text('View Details'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 2',
                                              child: Text('Eliminate Account'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 3',
                                              child: Text('Send Warning'),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'License Plate',
                                        style: bodyNormal,
                                      ),
                                      Text(
                                        '#000000',
                                        style: bodyNormal.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tenants',
                                        style: bodyNormal,
                                      ),
                                      Text(
                                        '04',
                                        style: bodyNormal.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tenants Added by Owner",
                          style: bodyNormal.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 18.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffF2F9FF),
                              border: Border.all(
                                color:
                                    const Color(0xffc7c6c6ff), // Border width
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
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
                                      PopupMenuButton<String>(
                                        icon: const Icon(Icons.more_vert),
                                        // 3-dots icon
                                        onSelected: (value) {
                                          // Handle the selected value
                                          if (value == "Option 1") {
                                            PageTransition.pageNavigation(
                                                page: const TenantDetails());
                                          }
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            const PopupMenuItem<String>(
                                              value: 'Option 1',
                                              child: Text('View Details'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 2',
                                              child: Text('Eliminate Account'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 3',
                                              child: Text('Send Warning'),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Apartment No',
                                        style: bodyNormal,
                                      ),
                                      Text(
                                        '#000000',
                                        style: bodyNormal.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Co Tenants',
                                        style: bodyNormal,
                                      ),
                                      Text(
                                        '04',
                                        style: bodyNormal.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ],
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
            ),
    );
  }
}
