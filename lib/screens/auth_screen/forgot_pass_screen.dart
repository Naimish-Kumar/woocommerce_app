import 'package:flutter/material.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/buttons.dart';
import '../Theme/theme.dart';
import 'otp_auth_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  bool isChecked = false;
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
                  color: isDark ? darkGreyTextColor : lightGreyTextColor,
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: isDark ? darkTitleColor : lightTitleColor,
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
                    text: 'Forgot Password',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 15),
                  MyGoogleText(
                    fontSize: 16,
                    fontColor: isDark ? darkGreyTextColor : lightGreyTextColor,
                    text: 'Enter your email below to receive your password',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              isDark ? const Color(0xff555671) : Colors.black,
                          width: 1),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                ),
                const SizedBox(height: 30),
                Button1(
                    buttonText: 'Send New Password',
                    buttonColor: kPrimaryColor,
                    onPressFunction: () {
                      const OtpAuthScreen().launch(context);
                    }),
                const SizedBox(height: 300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
