import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppers_bay/utils/routes/routes_name.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      //check condition
      Navigator.pushReplacementNamed(context, RoutesName.loginview);
    });
  }
}
