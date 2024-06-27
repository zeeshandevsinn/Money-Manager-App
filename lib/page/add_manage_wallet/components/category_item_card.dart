import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              ),
            ],
            gradient: LinearGradient(
              colors: yellowGrediantColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(Icons.credit_card, color: blackColor),
            ),
            SizedBox(width: 12),
            Text(
              "Budget",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
