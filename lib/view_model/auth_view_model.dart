import 'package:flutter/material.dart';
import 'package:shoppers_bay/utils/routes/routes_name.dart';
import 'package:shoppers_bay/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // this method can be tailored as per the authorisation need , here is just a simple demonstration
  void loggingIn(BuildContext context, String username) {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      Utils.showSnackbar('Logged In Successfully !', context);
      Utils.toastMessage(username);
      setLoading(false);
      Navigator.pushReplacementNamed(context, RoutesName.homenavigator,
          arguments: username);
    });
  }
}
