import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_service_app/services/getRestaurentList.dart';
import 'package:online_service_app/widgets/restaurantLists.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.34,
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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // offers start
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      color: Colors.green,
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
                        ),
                        separatorBuilder: (_, index) => Container(width: 5),
                      ),
                    ),
                    // offers end

                    // swiggy pop start
                    Container(
                      height: MediaQuery.of(context).size.width / 6,
                      color: Colors.blue,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, index) => Container(
                          color: Colors.red,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                        separatorBuilder: (_, index) => Container(width: 5),
                      ),
                    ),
                    // swiggy pop end

                    // All Restaurants start
                    Container(
                      child: FutureBuilder(
                        future: getRestaurent(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var _jsonResponse = jsonDecode(snapshot.data);
                            // print(_jsonResponse.length);
                            return ListView.builder(
                              itemCount: 4, //_jsonResponse.length,
                              itemBuilder: (_, i) {
                                print(i);
                                // return restaurantListItem(
                                //   imageUrl: _jsonResponse[i]["imageUrl"],
                                //   name: _jsonResponse[i]["name"],
                                //   description: _jsonResponse[i]["location"],
                                //   rating: _jsonResponse[i]["rating"],
                                //   mins: _jsonResponse[i]["mins"],
                                //   price: _jsonResponse[i]["price"],
                                // );
                              },
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    // All Restaurants end
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
