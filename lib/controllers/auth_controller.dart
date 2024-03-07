import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api_services/api_exceptions.dart';
import '../api_services/data_api.dart';
import '../constants/custom_dialog.dart';
import '../constants/custom_navigation.dart';
import '../constants/global_variables.dart';
import '../models/user_model.dart';
import '../views/admin_screens/admin_dashboard.dart';
import 'general_controller.dart';

class AuthController extends GetxController {
  late UserModel userData;
  RxString token = "".obs;
  RxString fcmToken = ''.obs;
  RxInt userType = 0.obs;
  final GeneralController _generalController = Get.find<GeneralController>();
  

  /*<---------------------Register--------------------->*/
  

  Future userLogin(var body, BuildContext context, bool fromSplash) async {
    fromSplash ? null : _generalController.showLoading('Logging user...');
    http.Response response =
        await DataApiService.instance.post('/login', body).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(
            description: apiError["message"], context: context);
      } else {
        _generalController.handleError(error, context);
      }
    });
    if (response == null) return;
    fromSplash ? null : _generalController.hideLoading();
    var result = json.decode(response.body);
    print("result");
    print(result);
    if (response.statusCode == 200) {
      userData = UserModel.fromJson(result);
      token.value = response.headers['authorization']!;
      saveUserData(
          email: body['email'].toString(), pass: body['password'].toString());
      setUserLoggedIn(true);
      // await getUserDetail(body, context, true);
      // await _baseController.getActiveUserJobs(context, 1, "auth");
      // await _baseController.getPostedUserJobs(context, 1);
      // await _baseController.getCompletedUserJobs(context, 1);
      if (userData.user.role.name == "Admin") {
        PageTransition.pageProperNavigation(page: AdminDashboard());
        // PageTransition.pageProperNavigation(page: GuardDashboard());
      } else {
        // PageTransition.pageProperNavigation(page: AdminDashboard());
        // PageTransition.pageProperNavigation(page: GuardDashboard());
      }
      update();
    } else {
      _generalController.errorDialog(context, "Error", result['error']);

      // return "false";
    }
  }

  // Future editProfile(var body, BuildContext context, imageFile) async {
  //   _generalController.showLoading('Editing profile...');
  //   var response = await DataApiService.instance
  //       .multiPartPost('/edit-profile', imageFile, body)
  //       .catchError((error) {
  //     if (error is BadRequestException) {
  //       var apiError = json.decode(error.message!);
  //       CustomDialogBox.showErrorDialog(
  //           description: apiError["message"], context: context);
  //     } else {
  //       _generalController.handleError(error, context);
  //     }
  //   });
  //   if (response == null) return;
  //   var result = json.decode(response);
  //   if (result['status'] == true) {
  //     userData = UserModel.fromJson(result['data'][0]);
  //     _generalController.hideLoading();
  //     await _generalController.successDialog(
  //         context, "Success", result['message']);
  //     Get.find<GeneralController>().onBottomBarTapped(4);
  //     Get.to(() => CustomBottomNavBar());
  //     update();
  //     // Get.offAll(() => const CommonNavigationBar(index: 0));
  //     return "true";
  //   } else {
  //     _generalController.hideLoading();
  //     _generalController.errorDialog(context, "Error", result['message']);
  //     return "false";
  //   }
  // }
}
