import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/card_item_view.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WalletSuccessScreen extends StatefulWidget {
  const WalletSuccessScreen({Key? key}) : super(key: key);

  @override
  State<WalletSuccessScreen> createState() => _WalletSuccessScreenState();
}

class _WalletSuccessScreenState extends State<WalletSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            Positioned(
              top: 56,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your account is ready',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: blackColor,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You can add more wallet by pressing add button\non homepage and profile menu',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: blackColor.withOpacity(0.7),
                        ),
                  ),
                  const SizedBox(height: 36),
                  const CardItemView(),
                ],
              ),
            ),
            Positioned(
              bottom: 32,
              left: 24,
              right: 24,
              child: PrimaryButton(
                text: 'Explore Now',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
