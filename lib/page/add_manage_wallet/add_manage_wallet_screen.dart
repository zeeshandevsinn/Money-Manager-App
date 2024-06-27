import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/widgets/bottom_navigation_bar.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/category_list_view.dart';
import 'components/credit_card_list_view.dart';

class AddManageWalletScreen extends StatefulWidget {
  const AddManageWalletScreen({Key? key}) : super(key: key);

  @override
  _AddManageWalletScreenState createState() => _AddManageWalletScreenState();
}

class _AddManageWalletScreenState extends State<AddManageWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const CreditCardListView(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const CategoryListView(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(hintText: "\$444")),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
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
              child: Container(
                height: 72,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: greyColor),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: SvgPicture.asset(
                        Kimages.databaseIcon,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Food & Drink",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
                child: SwitchListTile.adaptive(
              dense: true,
              activeColor: secondaryColor,
              inactiveThumbColor: secondaryColor,
              inactiveTrackColor: secondaryColor,
              activeTrackColor: secondaryColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: false,
              onChanged: (v) {},
              title: const Text(
                "Reset every month",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 34)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: PrimaryButton(
                  text: "Add Wallet",
                  grediantColor: blueGrediantColor,
                  onPressed: () {},
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SizedBox(width: 8),
                Icon(Icons.arrow_back_ios),
              ],
            ),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Kimages.menuIcon)),
          ],
        ),
      ),
    );
  }
}
