import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.themeColor1,
        toolbarHeight: 80,
        title: Text(
          'My profile',
          style: TextStyle(
              color: AppColor.blackcolor, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: .6),
        children: [
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(color: AppColor.themeColor3, fontSize: 25),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.wallet_giftcard_outlined,
                    size: 40,
                    color: AppColor.themeColor3,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blackcolor, width: 1),
                color: AppColor.greyColor,
                borderRadius: BorderRadius.circular(AppDimension.bradius1)),
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account',
                    style: TextStyle(color: AppColor.themeColor3, fontSize: 25),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.person_4_rounded,
                    color: AppColor.themeColor3,
                    size: 40,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blackcolor, width: 1),
                color: AppColor.greyColor,
                borderRadius: BorderRadius.circular(AppDimension.bradius1)),
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wishlist',
                    style: TextStyle(color: AppColor.themeColor3, fontSize: 25),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 40,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blackcolor, width: 1),
                color: AppColor.greyColor,
                borderRadius: BorderRadius.circular(AppDimension.bradius1)),
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Support',
                    style: TextStyle(color: AppColor.themeColor3, fontSize: 25),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.phone,
                    size: 40,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blackcolor, width: 1),
                color: AppColor.greyColor,
                borderRadius: BorderRadius.circular(AppDimension.bradius1)),
          ),
        ],
      ),
    );
  }
}
