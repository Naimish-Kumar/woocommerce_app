import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:woocommerce_app/generated/l10n.dart' as lang;
import 'package:woocommerce_app/language_screen_starting.dart';
import 'package:woocommerce_app/screens/home_screens/home.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../Providers/all_repo_providers.dart';
import '../../models/purchase_model.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  Future<void> pageNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    isRtl = prefs.getBool('isRtl') ?? false;
    await Future.delayed(
      const Duration(seconds: 3),
    );
    bool isValid = await PurchaseModel().isActiveBuyer();
    if (isValid) {
      if (customerId != null) {
        if (!mounted) return;
        const Home().launch(context, isNewTask: true);
      } else {
        if (!mounted) return;
        const LanguageScreenTwo().launch(context, isNewTask: true);
      }
    } else {
      showLicense(context: context);
    }
  }

  @override
  void initState() {
    pageNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 3),
              Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(180),
                ),
                child: const Image(
                  image: AssetImage(
                    'images/storelogo.png',
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    lang.S.of(context).splashScreenOneAppName,
                    style: GoogleFonts.dmSans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Text(
                    lang.S.of(context).splashScreenOneAppVersion,
                    style: GoogleFonts.dmSans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
