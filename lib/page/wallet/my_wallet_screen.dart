import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/card_item_view.dart';
import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    yellowColor,
                    orangeYellowColor,
                  ],
                )),
            child: const Center(child: Icon(Icons.add)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            6,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CardItemView(),
            ),
          ),
        ),
      ),
    );
  }
}
