import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../Providers/language_change_provider.dart';
import '../generated/l10n.dart' as lang;
import '../widgets/buttons.dart';
import 'Theme/theme.dart';
import 'home_screens/home.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Future<void> saveData(bool data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRtl', data);
  }

  List<String> languageList = [
    'English',
    'Hindi',
    'Arabic',
    'Chinese',
    'Spanish',
    'French',
    'Japanese',
    'Romanian',
    'Turkish',
    'Italian',
    'German',
    'Bengali',
    'Vietnamese',
    'Thai',
    'Portuguese',
    'Hebrew',
    'Polish',
    'Hungarian',
    'Finland',
    'Korean',
    'Malay',
    'Indonesian',
    'Ukrainian',
    'Bosnian',
    'Greek',
    'Dutch',
    'Urdu',
    'Sinhala',
    'Persian',
    'Serbian',
    'Khmer',
    'Lao',
    'Russian',
    'Kannada',
    'Marathi',
    'Tamil',
    'Afrikaans',
    'Czech',
    'Swedish',
    'Slovak',
    'Swahili',
    'Albanian',
    'Danish',
    'Azerbaijani',
    'Kazakh',
    'Croatian',
    'Nepali',
    'Burmese'
  ];
  String isSelected = 'English';

  List<String> baseFlagsCode = [
    'us',
    'in',
    'sa',
    'cn',
    'es',
    'fr',
    'jp',
    'ro',
    'tr',
    'it',
    'de',
    'BD',
    'VN',
    'TH',
    'PT',
    'IL',
    'PL',
    'HU',
    'FI',
    'KR',
    'MY',
    'ID',
    'UA',
    'BA',
    'GR',
    'NL',
    'Pk',
    'LK',
    'IR',
    'RS',
    'KH',
    'LA',
    'RU',
    'IN',
    'IN',
    'IN',
    'ZA',
    'CZ',
    'SE',
    'SK',
    'SK',
    'AL',
    'DK',
    'AZ',
    'KZ',
    'HR',
    'NP',
    'MM'
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
          child: Button1(
            buttonColor: const Color(0xFFFF7F00),
            buttonText: lang.S.of(context).saveButton,
            onPressFunction: () {
              saveData(!isRtl && isRtl);
              const Home().launch(context, isNewTask: true);
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              const Home().launch(context, isNewTask: true);
            },
            child: Icon(
              Icons.arrow_back,
              color: isDark ? darkTitleColor : lightTitleColor,
            ),
          ),
          title: MyGoogleText(
            text: lang.S.of(context).language,
            fontColor: isDark ? darkTitleColor : lightTitleColor,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: languageList.length,
                  itemBuilder: (_, i) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          isSelected = languageList[i];
                          isSelected == 'Hindi'
                              ? context
                                  .read<LanguageChangeProvider>()
                                  .changeLocale("hi")
                              : isSelected == 'Arabic'
                                  ? context
                                      .read<LanguageChangeProvider>()
                                      .changeLocale("ar")
                                  : isSelected == 'Chinese'
                                      ? context
                                          .read<LanguageChangeProvider>()
                                          .changeLocale("zh")
                                      : isSelected == 'Spanish'
                                          ? context
                                              .read<LanguageChangeProvider>()
                                              .changeLocale("es")
                                          : isSelected == 'French'
                                              ? context
                                                  .read<
                                                      LanguageChangeProvider>()
                                                  .changeLocale("fr")
                                              : isSelected == 'Japanese'
                                                  ? context
                                                      .read<
                                                          LanguageChangeProvider>()
                                                      .changeLocale("ja")
                                                  : isSelected == 'Romanian'
                                                      ? context
                                                          .read<
                                                              LanguageChangeProvider>()
                                                          .changeLocale("ro")
                                                      : isSelected == 'Turkish'
                                                          ? context
                                                              .read<
                                                                  LanguageChangeProvider>()
                                                              .changeLocale(
                                                                  "tr")
                                                          : isSelected ==
                                                                  'Italian'
                                                              ? context
                                                                  .read<
                                                                      LanguageChangeProvider>()
                                                                  .changeLocale(
                                                                      "it")
                                                              : isSelected ==
                                                                      'German'
                                                                  ? context
                                                                      .read<
                                                                          LanguageChangeProvider>()
                                                                      .changeLocale(
                                                                          "de")
                                                                  : isSelected ==
                                                                          "Bengali"
                                                                      ? context
                                                                          .read<LanguageChangeProvider>()
                                                                          .changeLocale("bn")
                                                                      : isSelected == "Vietnamese"
                                                                          ? context.read<LanguageChangeProvider>().changeLocale("vi")
                                                                          : isSelected == "Thai"
                                                                              ? context.read<LanguageChangeProvider>().changeLocale("th")
                                                                              : isSelected == "Portuguese"
                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("pt")
                                                                                  : isSelected == "Hebrew"
                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("he")
                                                                                      : isSelected == "Polish"
                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("pl")
                                                                                          : isSelected == "Hungarian"
                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("hu")
                                                                                              : isSelected == "Finland"
                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("fi")
                                                                                                  : isSelected == "Korean"
                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("ko")
                                                                                                      : isSelected == "Malay"
                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("ms")
                                                                                                          : isSelected == "Indonesian"
                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("id")
                                                                                                              : isSelected == "Ukrainian"
                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("uk")
                                                                                                                  : isSelected == "Bosnian"
                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("bs")
                                                                                                                      : isSelected == "Greek"
                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("el")
                                                                                                                          : isSelected == "Dutch"
                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("nl")
                                                                                                                              : isSelected == "Urdu"
                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("ur")
                                                                                                                                  : isSelected == "Sinhala"
                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("si")
                                                                                                                                      : isSelected == "Persian"
                                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("fa")
                                                                                                                                          : isSelected == "Serbian"
                                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("sr")
                                                                                                                                              : isSelected == "Khmer"
                                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("km")
                                                                                                                                                  : isSelected == "Lao"
                                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("lo")
                                                                                                                                                      : isSelected == "Russian"
                                                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("ru")
                                                                                                                                                          : isSelected == "Kannada"
                                                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("kn")
                                                                                                                                                              : isSelected == "Marathi"
                                                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("mr")
                                                                                                                                                                  : isSelected == "Tamil"
                                                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("ta")
                                                                                                                                                                      : isSelected == "Afrikaans"
                                                                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("af")
                                                                                                                                                                          : isSelected == "Czech"
                                                                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("cs")
                                                                                                                                                                              : isSelected == "Swedish"
                                                                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("sv")
                                                                                                                                                                                  : isSelected == "Slovak"
                                                                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("sk")
                                                                                                                                                                                      : isSelected == "Swahili"
                                                                                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("sw")
                                                                                                                                                                                          : isSelected == "Albanian"
                                                                                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("sq")
                                                                                                                                                                                              : isSelected == "Danish"
                                                                                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("da")
                                                                                                                                                                                                  : isSelected == "Azerbaijani"
                                                                                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("az")
                                                                                                                                                                                                      : isSelected == "Kazakh"
                                                                                                                                                                                                          ? context.read<LanguageChangeProvider>().changeLocale("kk")
                                                                                                                                                                                                          : isSelected == "Croatian"
                                                                                                                                                                                                              ? context.read<LanguageChangeProvider>().changeLocale("hr")
                                                                                                                                                                                                              : isSelected == "Nepali"
                                                                                                                                                                                                                  ? context.read<LanguageChangeProvider>().changeLocale("ne")
                                                                                                                                                                                                                  : isSelected == "Burmese"
                                                                                                                                                                                                                      ? context.read<LanguageChangeProvider>().changeLocale("my")
                                                                                                                                                                                                                      : context.read<LanguageChangeProvider>().changeLocale("en");

                          isSelected == 'Arabic' ? isRtl = true : isRtl = false;
                        });
                      },
                      title: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 25,
                            child: Flag.fromString(
                              baseFlagsCode[i],
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Text(
                            languageList[i],
                          ),
                        ],
                      ),
                      trailing: isSelected == languageList[i]
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFFFF7F00),
                            )
                          : const Icon(
                              Icons.circle_outlined,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
