import 'package:flutter/material.dart';
import 'package:shoppers_bay/res/screens/screens_list.dart';

//this page control the inter page navigation througn nav bar

class HomeNavigatorPage extends StatefulWidget {
  final String username;
  HomeNavigatorPage({super.key, required this.username});

  @override
  State<HomeNavigatorPage> createState() => _HomeNavigatorPageState();
}

class _HomeNavigatorPageState extends State<HomeNavigatorPage> {
  ValueNotifier<int> _currentindex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    List<Widget> screen = ScreenList.screenList(widget.username);
    return ValueListenableBuilder(
      valueListenable: _currentindex,
      builder: (context, value, child) {
        return Scaffold(
          body: screen[_currentindex.value],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              onTap: (value) {
                _currentindex.value = value;
              },
              currentIndex: _currentindex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_4_sharp), label: 'Account'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_travel_sharp), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notifications'),
              ]),
        );
      },
    );
  }
}
