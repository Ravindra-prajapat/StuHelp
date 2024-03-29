
/*
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

import "../../features/authentication/models/user_model.dart";

/*


=========

todo:Step -2 [User Repository  to perform database Operations]
=======

*/

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "You account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong . Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
*/
