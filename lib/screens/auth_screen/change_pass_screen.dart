import 'package:flutter/material.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/buttons.dart';
import '../../widgets/confirmation_popup.dart';
import '../Theme/theme.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  bool password = true;
  bool hidePassword = true;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyGoogleText(
                  fontSize: 26,
                  fontColor: isDark ? darkTitleColor : lightTitleColor,
                  text: 'Change Password',
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 15),
                MyGoogleText(
                  fontSize: 16,
                  fontColor: isDark ? darkGreyTextColor : lightGreyTextColor,
                  text: 'The Password should have at least 6 characters',
                  fontWeight: FontWeight.normal,
                ),
              ],
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
                TextFormField(
                  obscureText: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              password = !password;
                            });
                          },
                          child: Icon(password
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                isDark ? const Color(0xff555671) : Colors.black,
                            width: 1),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                isDark ? const Color(0xff555671) : Colors.black,
                            width: 1),
                      ),
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 30),
                Button1(
                    buttonText: 'Submit',
                    buttonColor: kPrimaryColor,
                    onPressFunction: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const RedeemConfirmationScreen(
                            image: 'images/password_change_image.png',
                            mainText: 'Password Changed',
                            subText:
                                'Your password has been success fully changed!',
                            buttonText: 'Done',
                          ),
                        ),
                      );
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
