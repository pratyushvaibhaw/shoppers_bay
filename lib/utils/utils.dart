import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';

class Utils {
  //for showing toast
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        backgroundColor: AppColor.blackcolor,
        textColor: AppColor.whitecolor,
        gravity: ToastGravity.TOP,
        msg: msg);
  }

//snackbar
  static showSnackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(message)),
      duration: Duration(seconds: 2),
      backgroundColor: AppColor.themeColor3,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 5,
    ));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static Shimmer shimmerEffect(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Shimmer(
        direction: ShimmerDirection.ttb,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.blackcolor,
                    borderRadius: BorderRadius.circular(AppDimension.bradius1)),
                margin: EdgeInsets.all(20),
                height: _height * .180,
                width: _width,
              );
            }),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.greyColor,
              AppColor.greyColor,
              AppColor.greyColor,
              AppColor.greyColor,
              AppColor.whitecolor,
              AppColor.greyColor,
              AppColor.greyColor,
            ]));
  }
}
