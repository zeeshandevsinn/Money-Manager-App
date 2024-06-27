import 'package:kamino_app/page/auth/components/authentication_type_item.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationTypeView extends StatelessWidget {
  const AuthenticationTypeView({
    Key? key,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AuthenticationTypeItem(
            text: 'Email',
            isActive: !isActive,
            onTap: onTap,
          ),
          AuthenticationTypeItem(
            text: 'Phone',
            isActive: isActive,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
