import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionCardItem extends StatelessWidget {
  const TransactionCardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
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
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xffFFCF53),
            ),
          ),
        ],
      ),
    );
  }
}
