import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

class HomeController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  HomeController._internal();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final CustomPopupMenuController customPopupMenuController =
      CustomPopupMenuController();

  final naveListener = StreamController<int>.broadcast();
}
