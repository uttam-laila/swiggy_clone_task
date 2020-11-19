import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_service_app/pages/dishes.dart';
import 'package:online_service_app/pages/restaurants.dart';
import 'package:online_service_app/services/getRestaurentList.dart';
import 'package:online_service_app/widgets/restaurantLists.dart';

class SwiggyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("SwiggyPage"),
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
        actions: [
          Icon(Icons.ac_unit),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Text("Offers")),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                key: Key("restaurent"),
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
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(color: Colors.green, spreadRadius: 3),
                  //   ],
                  // ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              // color: Colors.green,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) => Container(
                  color: Colors.red,
                  height: (MediaQuery.of(context).size.height / 4),
                  width: (MediaQuery.of(context).size.height / 4),
                  child: Image(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/sale-special-offer-price-tags-design_1588-573.jpg?size=338&ext=jpg"),
                  ),
                ),
                separatorBuilder: (_, index) => Container(width: 5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                child: FutureBuilder(
                  future: getRestaurent(),
                  builder: (BuildContext _context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var _jsonResponse = jsonDecode(snapshot.data);
                      return Container(
                          // height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                        itemCount: _jsonResponse.length,
                        itemBuilder: (context, i) {
                          // return Text(i.toString());
                          return GestureDetector(
                            child: restaurantListItem(
                              imageUrl: _jsonResponse[i]["imageUrl"],
                              name: _jsonResponse[i]["name"],
                              location: _jsonResponse[i]["location"],
                              description: _jsonResponse[i]["description"],
                              rating: _jsonResponse[i]["rating"],
                              mins: _jsonResponse[i]["mins"],
                              price: _jsonResponse[i]["price"],
                            ),
                            onTap: () {
                              print(i);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DishPage(
                                  title: _jsonResponse[i]["name"],
                                  type: _jsonResponse[i]["description"],
                                  location: _jsonResponse[i]["location"],
                                );
                              }));
                            },
                          );
                        },
                      ));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
