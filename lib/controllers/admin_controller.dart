import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/data_api.dart';
import '../constants/custom_dialog.dart';
import '../models/admin_dashboard_model.dart';
import 'general_controller.dart';

class AdminController extends GetxController {
  
  
  AdminDashBoardModel? adminDashBoard;
  
  final GeneralController _generalController = Get.find<GeneralController>();

  get apiError => false;

  final GeneralController generalController = Get.find<GeneralController>();
  bool loading = false;

  Future<void> getAdminDashBoard(BuildContext context) async {
    if (loading) return;

    loading = true;
    update();

    try {
      var response = await DataApiService.instance.get('/admin/dashboard');
      var result = json.decode(response);
      adminDashBoard = AdminDashBoardModel.fromJson(result);
    } catch (error) {
      print("Error fetching admin dashboard: $error");
      CustomDialogBox.showErrorDialog(
        description: "Error fetching admin dashboard",
        context: context,
      );
    } finally {
      loading = false;
      update();
    }
  }
}
