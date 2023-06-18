import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:application1/src/units/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:tPrimaryColor,
        elevation: 0,
        title: const Text('Email Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An email has been sent to your email address.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20,right: 20),
              width: double.infinity,
              child: ElevatedButton(
              
                onPressed: () {
                  // Check if user has verified their email
                  checkEmailVerification();
                },
                child: const Text('Check Email Verification'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();

    if (user != null && user.emailVerified) {
      // User has verified their email, navigate to dashboard
      Get.offAll(() => const Dashboard());
    } else {
      // User has not verified their email
      Utils.toastMessage('Email verification is pending.');
    }
  }
}
