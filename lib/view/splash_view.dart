import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor1,
      body: Center(
        child: Text(
          'SHOPPERS\n  _B A Y',
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w100,
              color: AppColor.blackcolor),
        ),
      ),
    );
  }
}
