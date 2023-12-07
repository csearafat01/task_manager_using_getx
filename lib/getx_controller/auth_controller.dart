import 'package:get/get.dart';
import '../../data/network-utils.dart';
import '../ui/utils/auth-utils.dart';

class AuthController extends GetxController {
  bool loginInProgress = false;

  Future<bool> login(String email, String password) async {
    loginInProgress = true;
    update();
    final result = await NetworkUtils()
        .postMethod('https://task.teamrabbil.com/api/v1/login', body: {
      'email': email,
      'password': password
    });
    loginInProgress = false;
    if (result != null && result['status'] == 'success') {
      /// save user information
      await AuthUtils.saveUserData(
        result['data']['firstName'],
        result['data']['lastName'],
        result['token'],
        result['data']['photo'],
        result['data']['mobile'],
        result['data']['email'],
      );
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}