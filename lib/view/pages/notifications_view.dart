import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/colors.dart';

class NotificationView extends StatelessWidget {
  NotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 150,
        leading: Center(
          child: Text(
            'Notifications 0',
            style: TextStyle(
                color: AppColor.blackcolor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: AppColor.themeColor1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'You have no notifications ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
