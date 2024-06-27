import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/credit_card_list_view.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';

class HomePage extends StatefulWidget {
  final uid;
  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData _themeData;
  late TextTheme _textTheme;

  Map<String, dynamic>? profileData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData(widget.uid);
  }

  Future<void> fetchProfileData(uid) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      setState(() {
        profileData = doc.data() as Map<String, dynamic>;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching profile data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _textTheme = _themeData.textTheme;
    return SafeArea(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : CustomScrollView(
              slivers: [
                _buildProfileView(),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
                // const CreditCardListView(),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
                _buildAmountAlocate(),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                //         _buildHeader(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildTransaction(),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                _buildIncomeExpense(
                    profileData!['Balance'], profileData!['Expense']),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildMonthlyLimit(),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
    );
  }

  SliverToBoxAdapter _buildTransaction() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Text(
              "All Expenses",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            const Spacer(),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                    colors: blueGrediantColor,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: Center(child: SvgPicture.asset(Kimages.trendingDown)),
            ),

            const Spacer(),
            // Container(
            //   height: 48,
            //   width: 48,
            //   decoration: BoxDecoration(
            //       color: greyColor, borderRadius: BorderRadius.circular(24)),
            //   child: const Icon(Icons.search),
            // ),
            // const SizedBox(width: 10),
            // Container(
            //   height: 48,
            //   width: 48,
            //   decoration: BoxDecoration(
            //       color: greyColor, borderRadius: BorderRadius.circular(24)),
            //   child: const Icon(Icons.calendar_today),
            // ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildIncomeExpense(int balance, var expense) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: _costCard(
                  "Income", "\$ $balance", Kimages.trendingUp, false)),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _costCard(
                  "Expense", "\$ $expense", Kimages.trendingDown, true)),
        ],
      ),
    );
  }

  Container _costCard(String title, String balance, img, isExpense) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                  colors: blueGrediantColor,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
            child: Center(child: SvgPicture.asset(img)),
          ),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          Text(balance,
              style: isExpense
                  ? TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)
                  : TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildMonthlyLimit() {
    var limit = profileData?['Limit'] ?? 2000;
    return SliverToBoxAdapter(
      child: Container(
        height: 72,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: greyColor),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: secondaryColor,
              radius: 20,
              child: Icon(Icons.dangerous_outlined),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Monthly spending limit",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 2),
                Text(
                  "\$ $limit",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            // const Spacer(),
            // const Icon(Icons.more_horiz_outlined),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAmountAlocate() {
    var balance = profileData?['Balance'] ?? 4800;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Total wallet",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 72,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: greyColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    "\$ $balance",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: PrimaryButton(
                    text: "Balance",
                    maximumSize: const Size(150, 40),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                  profileData?['Name'] ?? "Janathon",
                  style: _textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            CircleAvatarWithNetworkImage(
                imageUrl: profileData?['ProfileImg'], radius: 30)
          ],
        ),
      ),
    );
  }
}

class CircleAvatarWithNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  CircleAvatarWithNetworkImage({
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200], // Placeholder background color
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Icon(
              Icons.account_circle,
              size: radius * 2,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
