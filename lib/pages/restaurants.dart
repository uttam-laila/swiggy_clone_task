import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_service_app/pages/dishes.dart';
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
      key: Key("restaurentScreen"),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
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
        actions: [
          Icon(Icons.ac_unit),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Text("Offers")),
          )
        ],
      ),
      body: Container(
        // color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.1,
        child: ListView(
          // scrollDirection: Axis.horizontal,
          children: <Widget>[
            // offers start
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
            // offers end

            // swiggy pop start
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width / 5,
              // color: Colors.blue,
              width: double.infinity,
              // margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.separated(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) => Column(
                        children: [
                          Stack(children: [
                            Container(
                              width: 50,
                              height: 30,
                              alignment: Alignment.topCenter,
                              color: Colors.red[50],
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Icon(Icons.sms_failed_sharp))
                          ]),
                          Text("Safety"),
                        ],
                      ),
                  separatorBuilder: (_, index) => Container(
                        width: 50,
                        height: 50,
                      )),
            ),
            // swiggy pop end

            // All Restaurants start
            Container(
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
            // All Restaurants end
          ],
        ),
      ),
    );
  }
}
