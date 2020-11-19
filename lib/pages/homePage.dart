import 'package:flutter/material.dart';
import 'package:online_service_app/pages/accountPage.dart';
import 'package:online_service_app/pages/cartPage.dart';
import 'package:online_service_app/pages/searchPage.dart';
import 'package:online_service_app/pages/swiggyPage.dart';

class HomePage extends StatefulWidget {
  final int seselectedIndex;

  const HomePage({Key key, this.seselectedIndex}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.seselectedIndex;
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(fontSize: 11),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(seselectedIndex: 0);
                }));
              },
            ),
            label: 'SWIGGY',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(seselectedIndex: 1);
                }));
              },
            ),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.add_shopping_cart),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(seselectedIndex: 2);
                }));
              },
            ),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.person_outline),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(seselectedIndex: 3);
                }));
              },
            ),
            label: 'ACCOUNT',
          ),
        ],
      ),
    );
  }
}
