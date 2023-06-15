import 'package:application1/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_phone/forget_password_phone.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgetPasswordTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    tForgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ForgetPasswordBtnWidget(
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ForgetPasswordMailScreen(),
                        ),
                      );
                    },
                    btnIcon: Icons.mail_outline_rounded,
                    title: tEmail,
                    subTitle: tResetViaEMail,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    title: tPhoneNo,
                    subTitle: tResetViaPhone,
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ForgetPasswordPhoneScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ));
  }
}
