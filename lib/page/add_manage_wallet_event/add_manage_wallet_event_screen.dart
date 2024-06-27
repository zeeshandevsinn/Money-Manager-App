import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/widgets/bottom_navigation_bar.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'components/category_list_view.dart';
import 'components/credit_card_list_view.dart';

class AddManageWalletEventScreen extends StatefulWidget {
  const AddManageWalletEventScreen({Key? key}) : super(key: key);

  @override
  _AddManageWalletEventScreenState createState() =>
      _AddManageWalletEventScreenState();
}

class _AddManageWalletEventScreenState
    extends State<AddManageWalletEventScreen> {
  late ThemeData _themeData;
  late TextTheme _textTheme;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _textTheme = _themeData.textTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildProfileView(),
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
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(hintText: "Holiday")),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 72,
            //     alignment: Alignment.centerLeft,
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     margin: const EdgeInsets.symmetric(horizontal: 8),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30), color: greyColor),
            //     child: Row(
            //       children: [
            //         CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 20,
            //           child: SvgPicture.asset(
            //             Kimages.databaseIcon,
            //           ),
            //         ),
            //         const SizedBox(width: 12),
            //         const Text(
            //           "Food & Drink",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //         const Spacer(),
            //         const Icon(Icons.arrow_forward_ios),
            //       ],
            //     ),
            //   ),
            // ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: greyColor),
                          child: Row(
                            children: const [
                              Text(
                                "06/30/2021",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 24),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "End Date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: greyColor),
                          child: Row(
                            children: const [
                              Text(
                                "06/30/2021",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 24),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  SliverToBoxAdapter _buildProfileView() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: _textTheme.caption!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "Jonathon Doe",
                  style: _textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const CircleAvatar(backgroundColor: Colors.grey, radius: 20),
          ],
        ),
      ),
    );
  }
}
