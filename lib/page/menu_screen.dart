import 'package:expandable/expandable.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [
        Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(24)),
              child:
                  const Icon(Icons.edit_calendar_outlined, color: Colors.grey),
            ),
            const SizedBox(width: 10),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.calendar_today, color: Colors.grey),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ]),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const SizedBox(height: 36),
          const Text(
            "FAQ",
            style: TextStyle(
                color: Color(0xff240F51),
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 11),
          const Text(
            "You can add more wallet by pressing add button on homepage and profile menu",
            style: TextStyle(fontSize: 14, height: 1.8),
          ),
          const SizedBox(height: 32),
          TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Search here by topics",
              isCollapsed: true,
              suffixIcon: IconButton(
                highlightColor: Colors.transparent,
                icon: Container(
                    width: 36.0,
                    height: 36,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.search, color: Colors.white)),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildExpensionTitle("How to add wallet",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi."),
          const SizedBox(height: 12),
          _buildExpensionTitle("How to delete my wallet",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi."),
          const SizedBox(height: 12),
          _buildExpensionTitle("How to change password",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi."),
          const SizedBox(height: 12),
          _buildExpensionTitle("How to edit personal info",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi."),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  ExpandableNotifier _buildExpensionTitle(String title, String content) {
    return ExpandableNotifier(
      child: Builder(builder: (context) {
        var controller = ExpandableController.of(context, required: true)!;
        return Expandable(
          collapsed: InkWell(
            onTap: () {
              controller.toggle();
            },
            child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                )),
          ),
          expanded: Column(
            children: [
              InkWell(
                onTap: () {
                  controller.toggle();
                },
                child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Icon(Icons.keyboard_arrow_up)
                      ],
                    )),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 12, height: 1.8),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
