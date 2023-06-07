import "package:application1/src/repository/authentication_repository/authentication_repository.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Text Field COntrollers to get data from textFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createuserWithEmailAndPassword(email, password);
  }
}
