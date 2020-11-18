import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_service_app/pages/restaurants.dart';

class SwiggyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        title: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Row(
                    children: [
                      Icon(Icons.location_history),
                      Text(
                        "Unnamed Road",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "Unnamed Road, Jayanagar, Bengaluru",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [Icon(Icons.ac_unit), Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Text("Offers")),
        )],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RestaurantPage();
                  }));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Color.fromRGBO(121, 23, 23, 0.5),
                  child: Center(
                    child: Text(
                      "Restaurants",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
