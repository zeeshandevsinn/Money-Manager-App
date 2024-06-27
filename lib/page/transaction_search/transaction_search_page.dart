import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionSearchPage extends StatelessWidget {
  const TransactionSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
            _searchField(),
            _buildOneDayTransaction(),
            _buildOneDayTransaction(),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _searchField() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Food", suffixIcon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildRenderObjectWidget _buildOneDayTransaction() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friday",
                      style: TextStyle(
                          color: blackColor.withOpacity(0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "19-06-2021",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      fontSize: 12,
                      color: blackColor.withOpacity(.7),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
            _transactionCard(Kimages.trendingDown, "Food & Drink",
                "02.00 pm, 19 Jun 2021", "-\$23"),
          ],
        ),
      ),
    );
  }

  Widget _transactionCard(
      String image, String title, String subTitle, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: SvgPicture.asset(image, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  color: blackColor.withOpacity(.7),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "-\$23",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFCF53)),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Kimages.menuIcon)),
          ],
        ),
      ),
    );
  }
}
