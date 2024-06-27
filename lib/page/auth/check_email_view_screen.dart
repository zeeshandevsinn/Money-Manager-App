import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CheckEmailViewScreen extends StatelessWidget {
  const CheckEmailViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const AuthCustomAppBar(isDropDownShow: false)),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    yellowColor,
                    orangeYellowColor,
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.email_outlined,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Check your email',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 24),
            Text(
              "We've sent a password recover instructions to\nyour email.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: captionColor,
                  ),
            ),
            const SizedBox(height: 54),
            Divider(
              thickness: 1,
              color: captionColor.withOpacity(0.3),
            ),
            const SizedBox(height: 48),
            Text(
              "Did not receive the email?",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: captionColor,
                  ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Send again",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: darkBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            const SizedBox(height: 62),
            PrimaryButton(
              text: 'Verify OTP',
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.verifyOTP);
              },
            ),
            const SizedBox(height: 84),
            TextButton(
              onPressed: () {},
              child: Text(
                "Skip, i'll confirm later",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: captionColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
