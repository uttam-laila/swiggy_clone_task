import 'package:flutter/material.dart';
import 'package:online_service_app/pages/accountPage.dart';
import 'package:online_service_app/pages/cartPage.dart';
import 'package:online_service_app/pages/searchPage.dart';
import 'package:online_service_app/pages/swiggyPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    SwiggyPage(),
    SearchPage(),
    CartPage(),
    AccountPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final labelTextStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 11.0);
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        selectedLabelStyle: labelTextStyle,
        unselectedLabelStyle: labelTextStyle,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'SWIGGY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'ACCOUNT',
          ),
        ],
      ),
    );
  }
}
