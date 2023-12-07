import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_using_getx/ui/screens/SplashScreen.dart';

import 'getx_controller/auth_controller.dart';


main(){
  runApp(const TaskManager());
}

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManager.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding: StoreBindings(),
      home: const SplashScreen(),
    );
  }
}

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}