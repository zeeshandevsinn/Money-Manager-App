import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kamino_app/page/home/home_page.dart';
import 'package:kamino_app/page/manage/manage_all_screen.dart';
import 'package:kamino_app/page/report_screen.dart';
import 'package:kamino_app/page/transaction/transaction_page.dart';
import 'package:kamino_app/page/wallet/add_new_wallet_screen.dart';
import 'package:kamino_app/widgets/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  final uid;
  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listScreens = [
    HomePage(
      uid: "",
    ),
    TransactionPage(
      userUid: FirebaseAuth.instance.currentUser!.uid,
    ),
    AddNewWalletScreen(),
    ManageAllScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    return Scaffold(
      body: StreamBuilder(
        initialData: 0,
        stream: homeController.naveListener.stream,
        builder: (_, AsyncSnapshot<int> index) {
          if (index == 0) {
            return HomePage(uid: widget.uid);
          } else
            return listScreens[index.data ?? 0];
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
