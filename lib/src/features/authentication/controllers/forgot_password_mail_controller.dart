import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();

  void reset() {
    AuthenticationRepository.instance
        .resetPassword(email.text.trim());
  }
}
