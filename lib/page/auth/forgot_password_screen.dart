import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/auth/components/authentication_type_view.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isAuthType = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const AuthCustomAppBar(isDropDownShow: false)),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Enter the email associated with your account and\nwe'll send and email.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: captionColor,
                      ),
                ),
                const SizedBox(height: 36),
                AuthenticationTypeView(
                  isActive: isAuthType,
                  onTap: () {
                    setState(() {
                      isAuthType = !isAuthType;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autofillHints: [
                    !isAuthType
                        ? AutofillHints.email
                        : AutofillHints.telephoneNumber,
                  ],
                  keyboardType: !isAuthType
                      ? TextInputType.emailAddress
                      : TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    hintText: !isAuthType ? 'Email' : 'Phone number',
                  ),
                ),
                const SizedBox(height: 48),
                PrimaryButton(
                  text: 'Send Instructions',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.checkEmailView);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
