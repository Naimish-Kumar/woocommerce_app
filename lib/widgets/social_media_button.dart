import 'package:flutter/material.dart';
import 'package:woocommerce_app/const/constants.dart';
import 'package:woocommerce_app/const/hardcoded_text.dart';
import 'package:woocommerce_app/generated/l10n.dart' as lang;

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 70,
              color: textColors,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: MyGoogleText(
                fontSize: 20,
                fontColor: Colors.black,
                text: lang.S.of(context).otherSignIn,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              height: 1,
              width: 70,
              color: textColors,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 60,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Image(
                  image: AssetImage(HardcodedImages.facebook),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: textColors,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Image(
                  image: AssetImage(HardcodedImages.google),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: textColors,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Image(
                  image: AssetImage(HardcodedImages.apple),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
