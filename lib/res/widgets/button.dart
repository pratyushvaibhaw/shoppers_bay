import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  RoundButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 250,
        child: (loading)
            ? Center(
                child: CircularProgressIndicator(
                    backgroundColor: AppColor.blackcolor),
              )
            : Center(
                child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: AppColor.themeColor3),
              )),
        decoration: BoxDecoration(
            color: AppColor.themeColor1,
            borderRadius: BorderRadius.circular(AppDimension.bradius2)),
      ),
    );
  }
}
