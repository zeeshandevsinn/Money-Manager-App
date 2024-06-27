import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kamino_app/page/routes.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchValue();
  }

  fetchValue() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('secon_dashboard')
        .doc('second')
        .get();
    if (doc.get('value')) {
      Navigator.pushNamed(context, Routes.firstDashboard);
    } else {
      Navigator.pushNamed(context, Routes.secondDashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
