import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kamino_app/page/FAQ/faq_screen.dart';
import 'package:kamino_app/page/update_profile/update_profile.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Map<String, dynamic>? profileData;
  bool isLoading1 = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  fetchProfileData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      setState(() {
        profileData = doc.data() as Map<String, dynamic>;
        isLoading1 = false;
      });
    } catch (e) {
      print("Error fetching profile data: $e");
      setState(() {
        isLoading1 = false;
      });
    }
  }

  late ThemeData _themeData;

  late TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _textTheme = _themeData.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoading1
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : CustomScrollView(
                slivers: [
                  _buildProfileView(),
                  const SliverToBoxAdapter(child: SizedBox(height: 38)),
                  SliverToBoxAdapter(
                    child: _settingList(),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _settingList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _singleItem(Kimages.featherIcon, "My wallet"),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: greyColor),
            child: Column(
              children: [
                // _singleItemNotification(Kimages.bellIcon, "Notification"),
                // Container(color: const Color(0xffEBEBEB), height: 1),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoDialogRoute(
                              builder: (_) => UpdateProfileScreen(),
                              context: context));
                    },
                    child: _singleItem(Kimages.settinsIcon, "Settings")),
                Container(color: const Color(0xffEBEBEB), height: 1),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoDialogRoute(
                              builder: (_) => FAQScreen(), context: context));
                    },
                    child: _singleItem(Kimages.helpIcon, "FAQ")),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _singleItem(Kimages.logoutIcon, "Logout",
              (() => Utils.showAlertDialog(context))),
        ],
      ),
    );
  }

  Container _singleItem(String image, String text, [VoidCallback? onTap]) {
    return Container(
      height: 72,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: greyColor),
      child: InkWell(
        onTap: onTap != null
            ? () {
                onTap();
              }
            : null,
        child: Row(
          children: [
            SvgPicture.asset(image),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Container _singleItemNotification(String image, String text) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: greyColor),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Switch.adaptive(
            activeColor: secondaryColor,
            activeTrackColor: secondaryColor,
            inactiveTrackColor: secondaryColor,
            // inactiveThumbColor: secondaryColor,
            value: true,
            onChanged: (v) {},
          )
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
