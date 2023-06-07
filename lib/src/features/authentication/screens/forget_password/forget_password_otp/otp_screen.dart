import 'package:application1/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "${tOtpMessage}support@flutterproject.com",
              textAlign: TextAlign.center,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                print("OTP is => $code");
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(tNext),
                ))
          ]),
        ),
      ),
    );
  }
}
