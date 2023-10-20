import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  CartView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 100,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Cart Empty !!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
