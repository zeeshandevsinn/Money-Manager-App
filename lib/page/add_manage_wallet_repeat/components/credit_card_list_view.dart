import 'package:flutter/material.dart';

import 'credit_card_item.dart';

class CreditCardListView extends StatelessWidget {
  const CreditCardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 184.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => const CreditCardItem(),
        ),
      ),
    );
  }
}
