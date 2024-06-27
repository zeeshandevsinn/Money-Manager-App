import 'package:kamino_app/data/country.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:flutter/material.dart';

class AuthCustomAppBar extends StatelessWidget {
  const AuthCustomAppBar({
    Key? key,
    this.onChanged,
    this.currentValue,
    this.isDropDownShow = false,
  }) : super(key: key);

  final ValueChanged<Country?>? onChanged;
  final Country? currentValue;
  final bool isDropDownShow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Kimages.logo,
          fit: BoxFit.cover,
          height: 40,
          width: 40,
        ),
        if (isDropDownShow) ...[
          const Spacer(),
          DropdownButtonHideUnderline(
            child: DropdownButton<Country>(
              value: currentValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: countryList.map((Country items) {
                return DropdownMenuItem(
                  value: items,
                  child: Image.asset(items.picture),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          )
        ] else
          Flexible(
            child: Container(
              child: Text(
                "Kamino Money Manager",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: captionColor,
                    ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
      ],
    );
  }
}
