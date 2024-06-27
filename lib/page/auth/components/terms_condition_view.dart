import 'package:custom_check_box/custom_check_box.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TermsConditionView extends StatelessWidget {
  const TermsConditionView({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          value: isChecked,
          shouldShowBorder: true,
          borderColor: redColor,
          checkedFillColor: redColor,
          borderRadius: 4,
          borderWidth: 2,
          checkBoxSize: 16,
          onChanged: onChanged,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Agree to our ',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: captionColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              TextSpan(
                text: 'Terms and Service',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
