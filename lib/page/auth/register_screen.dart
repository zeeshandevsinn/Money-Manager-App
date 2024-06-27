import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kamino_app/data/country.dart';
import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/auth/components/authentication_type_view.dart';
import 'package:kamino_app/page/auth/components/have_an_account_or_not_view.dart';
import 'package:kamino_app/page/auth/components/terms_condition_view.dart';
import 'package:kamino_app/page/auth/verify_otp_screen.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Country? _country = countryList[0];

  bool isAuthType = false;

  bool isChecked = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  // ignore: unused_field
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  bool codeSent = false;

  void _registerPhoneNumber(number) async {
    setState(() {
      isLoading = true;
    });
    String phone = number;
    String password = passwordController.text.trim();

    if (phone.isNotEmpty && password.isNotEmpty) {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);

          // Store the user's password in Firebase Firestore or another secure storage
          // Navigate to home screen
          Navigator.pushReplacementNamed(context, '/home');
        },
        verificationFailed: (FirebaseAuthException e) {
          ToastUtil.showErrorToast(
              'Verification failed. Code: ${e.code}. Message: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            isLoading = false;
          });
          Navigator.push(
              context,
              CupertinoDialogRoute(
                  builder: (_) => VerifyOTPScreen(
                        VerificationID: verificationId,
                        resendToken: resendToken,
                        password: passwordController.text.trim(),
                        phone_number: number,
                      ),
                  context: context));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      ToastUtil.showErrorToast('Please enter a phone number and password.');
      setState(() {
        isLoading = false;
      });
    }
  }

  PhoneNumber initialNumber = PhoneNumber(isoCode: 'US');
  bool isLoading = false;
  bool validNumber = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AuthCustomAppBar(
          onChanged: (value) {
            setState(() {
              _country = value;
            });
          },
          currentValue: _country,
          isDropDownShow: false,
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
                  'Create an account',
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
                TextFormField(
                  controller: nameController,
                  autofillHints: const [AutofillHints.name],
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    hintText: 'Name',
                  ),
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
                          setState(() {
                            validNumber = value;
                          });
                        },
                        onSaved: onPhoneNumberSaved,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        initialValue: initialNumber,
                        textFieldController: phoneController,
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: const InputDecoration(
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
                TermsConditionView(
                  isChecked: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                const SizedBox(height: 48),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : PrimaryButton(
                        text: 'Register Now',
                        onPressed: !isAuthType
                            ? () async {
                                //email
                                if (nameController.text.trim().isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Name");
                                } else if (emailController.text
                                    .trim()
                                    .isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Email");
                                } else if (passwordController.text
                                    .trim()
                                    .isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Password");
                                } else if (isChecked == false) {
                                  ToastUtil.showErrorToast(
                                      "Please Agree Terms and Conditions of the App");
                                } else {
                                  await _registerWithEmail(
                                      context,
                                      emailController.text.trim(),
                                      passwordController.text.trim());

                                  // Navigator.pushReplacementNamed(
                                  //     context, Routes.accountSetup);
                                }
                              }
                            : () {
                                //Phone
                                if (nameController.text.trim().isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Name");
                                } else if (phoneController.text
                                    .trim()
                                    .isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Email");
                                } else if (passwordController.text
                                    .trim()
                                    .isEmpty) {
                                  ToastUtil.showErrorToast(
                                      "Please Enter Your Password");
                                } else if (isChecked == false) {
                                  ToastUtil.showErrorToast(
                                      "Please Agree Terms and Conditions of the App");
                                } else if (validNumber == false) {
                                  ToastUtil.showErrorToast('Invalid number');
                                } else {
                                  _registerPhoneNumber(completeNumber);
                                }
                              }),
                const SizedBox(height: 72),
                HaveAnAccountOrNotView(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  isLogin: false,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _registerWithEmail(context, email, password) async {
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = true;
    });
    try {
      // debugger();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ToastUtil.showSuccessToast("Successsfully Registered");
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacementNamed(context, Routes.accountSetup);
    } catch (e) {
      ToastUtil.showErrorToast("Something Went Wrong $e");
      setState(() {
        isLoading = false;
      });
      print("Firebase Error: $e");
    }
  }
}
