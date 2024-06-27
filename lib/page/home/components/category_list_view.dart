import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'category_item_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: false,
      children: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 76.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => const CategoryCard(),
            ),
          ),
        ),
      ],
    );
  }
}
