
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

  // final userRepo = Get.put(UserRepository());

  void registerUser() {
    final authRepository = AuthenticationRepository.instance;
    authRepository.signup(
      fullName.text.trim(),
      email.text.trim(),
      phoneNo.text.trim(),
      password.text.trim(),
    );
  }
   
  }
