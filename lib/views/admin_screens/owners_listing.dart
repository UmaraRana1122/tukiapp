import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../generated/assets.dart';
import '../../models/owner_model.dart';
import '../../widgets/custom_textfield.dart';

import '../../constants/custom_navigation.dart';
import '../../constants/global_variables.dart';
import 'create_owner.dart';
import 'owner_details.dart';
import 'package:http/http.dart' as http;

class OwnerListing extends StatefulWidget {
  const OwnerListing({Key? key}) : super(key: key);

  @override
  State<OwnerListing> createState() => _OwnerListingState();
}

class _OwnerListingState extends State<OwnerListing> {
  bool isLoading = false;
  List<OwnerModel> videos = [];
  @override
  void initState() {
    fetchOwnerData();
    // TODO: implement initState
    super.initState();
  }

  Future<void> fetchOwnerData() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Authorization': 'Bearer {{token}}',
      'Cookie':
          'auth_session=1k9%2FRh1tY2bI6AA2DOS7mCCNJwhlWscXB7yRezz72k2%2FsgPXtULhMwnyMig1367b%2BD8hGpR0%2Fq35ZcB9EcWmDcTkP8%2FlPkfrHI%2BKr7nAaWRNFRC74UFtJ0Lu%2BSkJGXqdnJOulTCHc0BHhOhdBmD%2Fzpj9dxxEw%2BrpcOpGCcquua91GXuJT6bhR3sAO13No%2FGAMhaadgwHz6gXM97LIH8CYdq%2ByGz29l4WqHsTesWmBbqhHXbIpZXNA0hE9LgeuC02JsBVWNpE5lCfTKzNWnJ%2BR9xmGpzmn73ShQmKuAzXSR84uQSFUzwl7w8fwT6ayylao6lnBkWmdHnOiK5fbRM1RFiQc%2FAugbhXBjTCZrL96cs%3D--7iSNNAH9JLVNjDir--zPBUAeujwFli5jvXQMeLBQ%3D%3D'
    };

    var url =
        Uri.parse('https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/owners');
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> ownerData = jsonResponse['owners'];
      videos = ownerData.map((obj) => OwnerModel.fromJson(obj)).toList();
      // Successful API call
      print('Response Body: ${response.body}');
      // Here, you can parse the response body as needed
    } else {
      // If the server returns an error
      print('Error: ${response.reasonPhrase}');
      // You can handle the error accordingly
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Owner List",
                  style: bodyNormal.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(page: const CreateOwner());
                    },
                    child: Container(
                      height: 4.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Border width
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add Owner +',
                          style: bodyNormal.copyWith(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Search id',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Assets.imagesFilter,
                          height: 16,
                        )),
                  ),
                ),
              ],
            ),
            isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: videos.length,
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
                                                videos[i]
                                                    .account!
                                                    .firstName
                                                    .toString(),
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
                                                page: const OwnerDetails());
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
                                        'Total Tenants & Co Owners',
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
