import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String VerificationID;
  const OTPScreen({super.key, required this.VerificationID});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
