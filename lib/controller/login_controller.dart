import 'package:get/get.dart';
import 'package:task_manager/controller/auth_controller.dart';

import '../data/model/usermodel.dart';
import '../data/network_caller.dart';
import '../data/network_response.dart';
import '../utility/urls.dart';

class LoginController extends GetxController {
  bool _loginInProgress = false;
  String failedmessage = '';
  bool get loginInProgress => _loginInProgress;

  Future<bool> login(String email, String password) async {
    _loginInProgress = true;
    update();

    NetworkResponse response = await NetworkCaller().postRequest(Urls.login,
        body: {
          'email': email,
          'password': password,
        },
        isLoginScreen: true);
    _loginInProgress = false;

    if (response.isSuccess) {
      await AuthController.saveUserInformation(response.jsonResponse?['token'],
          UserModel.fromJson(response.jsonResponse?['data']));
      return true;
    } else {
      if (response.statusCode == 401) {
        failedmessage = 'Please Chack your Email and PassWord';
      } else {
        failedmessage = 'Something Is Wrong Login faild';
      }
    }

    return false;
  }
}
