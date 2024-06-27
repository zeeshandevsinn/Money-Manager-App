import 'package:flutter/cupertino.dart';
import 'package:kamino_app/page/home/controller/home_controller.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    return StreamBuilder(
      initialData: 0,
      stream: homeController.naveListener.stream,
      builder: (_, AsyncSnapshot<int> index) {
        int _selectedIndex = index.data ?? 0;
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Kimages.homeIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Kimages.creditIcon),
              label: 'Expense',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Kimages.plusIcon),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Kimages.settinsIcon),
              label: 'Setting',
            ),
          ],
          // type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            if (index == 3) {
              Navigator.pushNamed(context, Routes.settingScreen);
            } else
              homeController.naveListener.sink.add(index);
          },
        );
      },
    );
  }
}
