import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';

class AddToCartButton {
  static Container button() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.bradius1),
        color: AppColor.whitecolor,
      ),
      height: 35,
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add to cart'),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
