import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPScreen extends StatefulWidget {
  String? VerificationID, password;
  var resendToken;
  var phone_number;
  VerifyOTPScreen(
      {Key? key,
      required this.VerificationID,
      required this.resendToken,
      required this.password,
      required this.phone_number})
      : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  bool isLoading = false;
  var OTP;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _verifyOTP(String otp, verificationId) async {
    // debugger();
    setState(() {
      isLoading = true;
    });
    String smsCode = otp;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      // debugger();
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance
          .collection('verify_phone')
          .doc(widget.phone_number)
          .set({
        "Phone": widget.phone_number,
        "Password": widget.password,
        "UID": FirebaseAuth.instance.currentUser?.uid
      });
      setState(() {
        isLoading = false;
      });
      ToastUtil.showSuccessToast("Your Data Sotred Successfully");
      // Store the user's password in Firebase Firestore or another secure storage
      // Navigate to home screen
      Navigator.pushReplacementNamed(context, '/account-setup');
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // debugger();
      ToastUtil.showErrorToast('Failed to sign in: ${e.toString()}');
    }
  }

  Timer? _timer;
  int _start = 60;
  bool _isButtonDisabled = true;
  PhoneAuthCredential? _phoneAuthCredential;

  void startTimer() {
    _isButtonDisabled = true;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isButtonDisabled = false;
            _start = 60;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> _resendOtp(String phoneNumber, int resendToken) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: resendToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        widget.VerificationID = verificationId;
        print("Code resent to $phoneNumber");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        widget.VerificationID = verificationId;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resendOtpHandler(number, resendToken) async {
    // Replace with the phone number and the actual resend token
    // Replace with the actual resend token

    await _resendOtp(number, resendToken);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AuthCustomAppBar(isDropDownShow: false)),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Verify identity',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 36),
                Pinput(
                  length: 6,
                  onCompleted: (pin) {
                    setState(() {
                      OTP = pin;
                    });
                  },
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  defaultPinTheme: PinTheme(
                    width: 70,
                    height: 70,
                    textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: blackColor,
                        ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: captionColor,
                        width: 0.5,
                      ),
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _isButtonDisabled
                      ? () {
                          ToastUtil.showErrorToast(
                              "Please Make sure Time is Out?");
                        }
                      : () {
                          _resendOtpHandler(
                              widget.phone_number, widget.resendToken);
                        },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn't receive the code? ",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: captionColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: 'Resend OTP in $_start seconds',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : PrimaryButton(
                        text: 'Verify',
                        onPressed: () async {
                          if (OTP != null) {
                            // debugger();
                            _verifyOTP(OTP, widget.VerificationID);
                          }
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
