import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:woocommerce_app/api_service/api_service.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:woocommerce_app/models/customer.dart';
import 'package:woocommerce_app/widgets/add_new_address.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:woocommerce_app/generated/l10n.dart' as lang;
import '../../widgets/buttons.dart';
import '../../widgets/social_media_button.dart';
import '../Theme/theme.dart';
import 'log_in_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  late APIService apiService;
  CustomerModel model = CustomerModel(email: '', userName: '', password: '');
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
                child: Icon(
                  Icons.arrow_back,
                  color: isDark ? darkTitleColor : lightTitleColor,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    'images/store.png',
                  ),
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'woocommerce_app',
                  style: kTextStyle.copyWith(
                      color: isDark ? Colors.white : const Color(0xff3E3E70),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
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
                      Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? Color(0xff555671)
                                          : Colors.black,
                                      width: 1),
                                ),
                                labelText: lang.S
                                    .of(context)
                                    .textFieldUserNameLabelText,
                                hintText: lang.S
                                    .of(context)
                                    .textFieldUserNameHintText,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .textFieldUserNameValidatorText1;
                                } else if (value.length < 4) {
                                  return lang.S
                                      .of(context)
                                      .textFieldUserNameValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.userName = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    lang.S.of(context).textFieldEmailLabelText,
                                hintText:
                                    lang.S.of(context).textFieldEmailHintText,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? Color(0xff555671)
                                          : Colors.black,
                                      width: 1),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .textFieldEmailValidatorText1;
                                } else if (!value.contains('@')) {
                                  return lang.S
                                      .of(context)
                                      .textFieldEmailValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.email = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    lang.S.of(context).textFieldPassLabelText,
                                hintText:
                                    lang.S.of(context).textFieldPassHintText,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? const Color(0xff555671)
                                          : Colors.black,
                                      width: 1),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .textFieldPassValidatorText1;
                                } else if (value.length < 4) {
                                  return lang.S
                                      .of(context)
                                      .textFieldPassValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.password = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Button1(
                          buttonText: lang.S.of(context).registerButtonText,
                          buttonColor: kPrimaryColor,
                          onPressFunction: () async {
                            if (validateAndSave()) {
                              EasyLoading.show(
                                  status:
                                      lang.S.of(context).easyLoadingRegister);

                              apiService.createCustomer(model).then((ret) {
                                globalKey.currentState?.reset();

                                if (ret) {
                                  EasyLoading.showSuccess(
                                      lang.S.of(context).easyLoadingSuccess);

                                  const AddNewAddress().launch(context);
                                } else {
                                  EasyLoading.showError(
                                      lang.S.of(context).easyLoadingError);
                                }
                              });
                            }
                          }),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              lang.S.of(context).alreadyAccount,
                              style: kTextStyle.copyWith(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: textColors,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              const LogInScreen().launch(
                                context,
                                //pageRouteAnimation: PageRouteAnimation.Fade,
                              );
                            },
                            child: Text(
                              lang.S.of(context).signInButtonText,
                              style: kTextStyle.copyWith(
                                fontSize: 16,
                                color: secondaryColor1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaButtons().visible(false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
