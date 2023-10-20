import 'package:flutter/material.dart';
import 'package:shoppers_bay/view/home_view.dart';
import 'package:shoppers_bay/view/pages/account_view.dart';
import 'package:shoppers_bay/view/pages/cart_view.dart';
import 'package:shoppers_bay/view/pages/notifications_view.dart';

class ScreenList {
  static List<Widget> screenList(String username) {
    return [
      HomeView(
        detail: username,
      ),
      AccountView(),
      CartView(),
      NotificationView()
    ];
  }
}
