import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/api_exceptions.dart';
import '../api_services/data_api.dart';
import '../constants/custom_dialog.dart';
import '../models/admin_dashboard_model.dart';
import 'general_controller.dart';

class AdminController extends GetxController {
  
  late AdminDashBoardModel adminDashBoard;
  
  final GeneralController _generalController = Get.find<GeneralController>();

  get apiError => false;

  Future getAdminDashBoard(BuildContext context) async {
    var response = await DataApiService.instance
        .get('/admin/dashboard')
        .catchError((error) {
      print("error");
      print(error.message!);
      if (error is BadRequestException) {
        CustomDialogBox.showErrorDialog(
            description: apiError["error"], context: context);
      } else {
        _generalController.handleError(error.message!, context);
      }
    });
    if (response == null) return;
    var result = json.decode(response);
    print("result");
    print(result);
    print("response.statusCode");
    print(response);

    adminDashBoard = AdminDashBoardModel.fromJson(result);
    return "true";
  }
}
