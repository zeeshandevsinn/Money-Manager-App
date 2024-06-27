import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomManageAppBar extends StatelessWidget {
  const CustomManageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 45,
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: yellowGrediantColor),
                borderRadius: BorderRadius.circular(21)),
            child: const Icon(Icons.credit_card, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Wallets",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(height: 2),
              Text(
                "\$ 6,000",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ],
          ),
          // const SizedBox(width: 12),
          // const Icon(Icons.keyboard_arrow_down, color: blueColor),
          // const Spacer(),
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset(Kimages.menuIcon),
          // ),
        ],
      ),
    );
  }
}
