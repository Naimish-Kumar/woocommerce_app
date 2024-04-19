// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woocommerce_app/api_service/api_service.dart';
import 'package:woocommerce_app/generated/l10n.dart' as lang;
import 'package:woocommerce_app/models/retrieve_customer.dart';
import 'package:woocommerce_app/widgets/buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Providers/all_repo_providers.dart';
import '../../const/constants.dart';
import '../../main.dart';
import '../Theme/theme.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key, required this.retrieveCustomer})
      : super(key: key);

  final RetrieveCustomer retrieveCustomer;

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  APIService? apiService;
  String? phoneNumber;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  RetrieveCustomer updateProfile = RetrieveCustomer();

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Consumer(builder: (context, ref, __) {
      return Directionality(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: isDark ? darkTitleColor : lightTitleColor,
              ),
            ),
            title: MyGoogleText(
              text: lang.S.of(context).myProfileScreenName,
              fontColor: isDark ? darkTitleColor : lightTitleColor,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(30),
                  width: context.width(),
                  height:
                      context.height() - (AppBar().preferredSize.height + 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    lang.S.of(context).fastNameTextFieldLabel,
                                hintText:
                                    lang.S.of(context).fastNameTextFieldHint,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? darkGreyTextColor
                                          : lightGreyTextColor,
                                      width: 1),
                                ),
                                labelStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkTitleColor
                                        : lightTitleColor),
                                hintStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkGreyTextColor
                                        : lightGreyTextColor),
                              ),
                              initialValue: widget.retrieveCustomer.firstName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .fastNameTextFieldValidator;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                updateProfile.firstName = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    lang.S.of(context).lastNameTextFieldLabel,
                                hintText:
                                    lang.S.of(context).lastNameTextFieldHint,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? darkGreyTextColor
                                          : lightGreyTextColor,
                                      width: 1),
                                ),
                                labelStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkTitleColor
                                        : lightTitleColor),
                                hintStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkGreyTextColor
                                        : lightGreyTextColor),
                              ),
                              initialValue: widget.retrieveCustomer.lastName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .lastNameTextFieldValidator;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                updateProfile.lastName = value!;
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
                                labelStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkTitleColor
                                        : lightTitleColor),
                                hintStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkGreyTextColor
                                        : lightGreyTextColor),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? darkGreyTextColor
                                          : lightGreyTextColor,
                                      width: 1),
                                ),
                              ),
                              initialValue: widget.retrieveCustomer.email,
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
                                updateProfile.email = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                    lang.S.of(context).textFieldPhoneLabel,
                                hintText: lang.S.of(context).textFieldPhoneHint,
                                labelStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkTitleColor
                                        : lightTitleColor),
                                hintStyle: kTextStyle.copyWith(
                                    color: isDark
                                        ? darkGreyTextColor
                                        : lightGreyTextColor),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: isDark
                                          ? darkGreyTextColor
                                          : lightGreyTextColor,
                                      width: 1),
                                ),
                              ),
                              initialValue:
                                  widget.retrieveCustomer.billing!.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S
                                      .of(context)
                                      .textFieldPhoneValidator;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                phoneNumber = value.toString();
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Button1(
                        buttonText: lang.S.of(context).updateProfileButton,
                        buttonColor: const Color(0xFFFF7F00),
                        onPressFunction: () {
                          if (validateAndSave()) {
                            EasyLoading.show(
                                status: lang.S.of(context).updateHint);
                            apiService!
                                .updateProfile(
                                    updateProfile, phoneNumber.toString())
                                .then((value) {
                              if (value) {
                                EasyLoading.showSuccess(
                                    lang.S.of(context).easyLoadingSuccess);

                                ref.refresh(getCustomerDetails);

                                const ProfileScreen().launch(context);
                              } else {
                                EasyLoading.showError(
                                    lang.S.of(context).easyLoadingError);
                              }
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
