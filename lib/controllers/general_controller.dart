import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../api_services/api_exceptions.dart';
import '../constants/custom_dialog.dart';
import '../constants/global_variables.dart';
import '../widgets/custom_widget.dart';

class GeneralController extends GetxController {
  void handleError(error, BuildContext context) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      CustomDialogBox.showErrorDialog(
        description: message,
        context: context,
      );
    } else if (error is FetchDataException) {
      var message = error.message;
      CustomDialogBox.showErrorDialog(description: message, context: context);
    } else if (error is ApiNotRespondingException) {
      CustomDialogBox.showErrorDialog(
          description: 'Oops! It took longer to respond.', context: context);
    }
  }

  showLoading([String? message]) {
    CustomDialogBox.showLoading(message);
  }

  hideLoading() {
    CustomDialogBox.hideLoading();
  }

  successDialog(BuildContext context, String titleHead, String description) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // title: Text("Notice"),
              // content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Icon(
                        Icons.done,
                        color: Colors.black,
                        size: 40,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        titleHead,
                        style: title.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description,
                        style: bodySmall.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        width: 150,
                        height: 45,
                        child: CustomButton(
                          buttonText: "OK",
                          onTap: () {
                            Get.back();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }

  errorDialog(BuildContext context, String titleHead, String description) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // title: Text("Notice"),
              // content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Icon(
                        Icons.error,
                        color: Colors.black,
                        size: 40,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        titleHead,
                        style: title.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description,
                        style: bodySmall.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        width: 150,
                        height: 45,
                        child: CustomButton(
                          buttonText: "OK",
                          onTap: () {
                            Get.back();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }
}
