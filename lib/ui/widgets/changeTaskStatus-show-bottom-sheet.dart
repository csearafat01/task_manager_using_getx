import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/network-utils.dart';
import '../../data/urls.dart';
import '../../main.dart';

showChangedTaskStatus(String currentStatus, String taskId, VoidCallback onChangeTaskStatus) {
  String statusValue = currentStatus;

  showModalBottomSheet(
      context: TaskManager.globalKey.currentContext!,
      builder: (context) {
        return StatefulBuilder(builder: (context, changeState) {
          return Column(
            children: [
              RadioListTile(
                  value: 'New',
                  title: const Text('New'),
                  groupValue: statusValue,
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Completed',
                  title: const Text('Completed'),
                  groupValue: statusValue,
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Cancelled',
                  title: const Text('Cancelled'),
                  groupValue: statusValue,
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Progress',
                  title: const Text('Progress'),
                  groupValue: statusValue,
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('Change Status'),
                  onPressed: () async {
                    final response = await NetworkUtils().getMethod(Urls.changeTaskUrl(taskId, statusValue));
                    if (response != null) {
                      onChangeTaskStatus();
                      Get.back(); // Equivalent to Navigator.pop(context)
                    } else {
                      Get.snackbar(
                        'Error',
                        'Status change failed. Try again!',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 3),
                        isDismissible: true,
                      );
                    }
                  },),
              )
            ],
          );
        });
      });
}
