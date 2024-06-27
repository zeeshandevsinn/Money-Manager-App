import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kamino_app/data/country.dart';
import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/auth/components/authentication_type_view.dart';
import 'package:kamino_app/page/auth/components/have_an_account_or_not_view.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController controller = TextEditingController();

  final TextEditingController otpController = TextEditingController();
  String completeNumber = '';

  void onPhoneNumberChanged(PhoneNumber number) {
    setState(() {
      completeNumber = number.phoneNumber ?? '';
    });
  }

  void onPhoneNumberSaved(PhoneNumber number) {
    setState(() {
      completeNumber = number.phoneNumber ?? '';
    });
  }

  bool isLoading = false;
  PhoneNumber initialNumber = PhoneNumber(isoCode: 'US');

  Country? _country;

  bool isAuthType = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: AuthCustomAppBar(
          onChanged: (value) {
            setState(() {
              _country = value;
            });
          },
          currentValue: _country,
          isDropDownShow: true,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adip\nsicing elit, sed do eiusmod.',
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
                !isAuthType
                    ? TextFormField(
                        controller: emailController,
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          hintText: 'Email',
                        ),
                      )
                    : InternationalPhoneNumberInput(
                        onInputChanged: onPhoneNumberChanged,
                        onInputValidated: (bool value) {
                          print(value ? 'Valid number' : 'Invalid number');
                        },
                        onSaved: onPhoneNumberSaved,
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        initialValue: initialNumber,
                        textFieldController: controller,
                        formatInput: true,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  autofillHints: const [AutofillHints.password],
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    hintText: 'Password',
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgotPassword);
                    },
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : PrimaryButton(
                        text: 'Login',
                        onPressed: !isAuthType
                            ? () async {
                                if (emailController.text.trim().isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Email");
                                } else if (passwordController.text
                                    .trim()
                                    .isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Password");
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    var user = await signInWithEmailPassword(
                                        emailController.text.trim(),
                                        passwordController.text.trim());

                                    ToastUtil.showSuccessToast(
                                        "Successfully Login");
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.homeScreen, (route) => false);
                                  } catch (e) {
                                    ToastUtil.showErrorToast(
                                        "Please Enter Correct Credentials");
                                  }
                                }
                              }
                            : () async {
                                print('Saved Complete Number: $completeNumber');
                                await signInWithPhone(completeNumber,
                                    passwordController.text.trim());
                              },
                      ),
                const SizedBox(height: 72),
                HaveAnAccountOrNotView(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  isLogin: true,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print('Error signing in with email and password: $e');
      return null;
    }
  }

  Map<String, dynamic>? phoneData;
  signInWithPhone(String number, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('verify_phone')
          .doc(number)
          .get();

      if (doc.get('Password') == passwordController.text.trim() &&
          doc.get('Phone') == completeNumber) {
        setState(() {
          isLoading = true;
        });
        ToastUtil.showSuccessToast("Successfully Login!");
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeScreen, (route) => false);
      } else {
        ToastUtil.showErrorToast("Invalid Credentials");
      }
    } catch (e) {
      debugger();
      setState(() {
        isLoading = false;
      });

      ToastUtil.showErrorToast("Some thing Went wrong $e");
    }
  }
}
