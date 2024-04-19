import 'package:flutter/material.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:woocommerce_app/screens/auth_screen/change_pass_screen.dart';
import 'package:woocommerce_app/screens/auth_screen/otp_test.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/buttons.dart';
import '../Theme/theme.dart';

class OtpAuthScreen extends StatefulWidget {
  const OtpAuthScreen({Key? key}) : super(key: key);

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                  width: 1,
                  color: textColors,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 30),
            child: SizedBox(
              height: 100,
              width: 248,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyGoogleText(
                    fontSize: 26,
                    fontColor: isDark ? darkTitleColor : lightTitleColor,
                    text: 'OTP Authentication',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 15),
                  MyGoogleText(
                    fontSize: 16,
                    fontColor: isDark ? darkGreyTextColor : lightGreyTextColor,
                    text:
                        'Please enter the 6-digit code sent to: shaidulislam@gmail.com',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                const OtpForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyGoogleText(
                      fontSize: 16,
                      fontColor:
                          isDark ? darkGreyTextColor : lightGreyTextColor,
                      text: 'Code send in 0:29',
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const MyGoogleText(
                        text: ' Resend code',
                        fontSize: 16,
                        fontColor: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Button1(
                    buttonText: 'Continue',
                    buttonColor: kPrimaryColor,
                    onPressFunction: () {
                      const ChangePassScreen().launch(context);
                    }),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
