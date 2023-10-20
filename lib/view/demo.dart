import 'package:flutter/material.dart';
import 'package:shoppers_bay/utils/utils.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Utils.shimmerEffect(context),
    );
  }
}
