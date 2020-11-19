import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_service_app/bloc/incrementItem.dart';
import 'package:online_service_app/pages/restaurants.dart';
import 'package:online_service_app/widgets/dishList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // @override
  // void initState() {
  //   // addValuesToBloc(countbloc, pricebloc);

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final _counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          FutureBuilder<String>(
              future: getData(),
              builder: (context, snapshot) {
                var _jsonData = jsonDecode(snapshot.data);
                if (_jsonData == null ||
                    _jsonData == "null" ||
                    _jsonData == "") {
                  return Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://www.kindpng.com/picc/m/289-2892204_your-cart-is-empty-empty-cart-icon-png.png"),
                        ),
                        MaterialButton(
                          color: Colors.green,
                          height: 40,
                          minWidth: 100,
                          child: Text(
                            "Go to Restaurents",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RestaurantPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: ListView.builder(
                      itemCount: _jsonData.length,
                      itemBuilder: (context, i) {
                        var imageUrl;
                        var name;
                        var veg;
                        var price;
                        if (_jsonData[0] == "0" || _jsonData[0] == "1") {
                          imageUrl = _jsonData[2];
                          name = _jsonData[1];
                          veg = _jsonData[0];
                          price = _jsonData[4];
                        } else {
                          imageUrl = _jsonData[i]["image"];
                          name = _jsonData[i]["name"];
                          veg = _jsonData[i]["veg"];
                          price = _jsonData[i]["price"];
                        }
                        if (snapshot.hasData &&
                            (_jsonData[0] != "0" ||
                                _jsonData[0] != "1")) {
                          if (_jsonData[i] == null) {
                            return CircularProgressIndicator();
                          }

                          return Container(
                            // height: MediaQuery.of(context).size.height / 2,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            margin: EdgeInsets.only(bottom: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // food info start
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 15),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 32,
                                          width: 32,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Image(
                                              image: NetworkImage(
                                                  "https://github.com/uttam-laila/foodAppTask/blob/master/assets/icons/nvicon.png?raw=true"),
                                              color: veg == "1"
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ),
                                        Text(name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "₹ $price",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff7e808c),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // food info end

                                // food image container start
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Image(
                                          height: 80,
                                          width: 80,
                                          image: NetworkImage(imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 64.0, left: 8),
                                          child: GestureDetector(
                                            child: Text(
                                              " Remove ",
                                              style: TextStyle(
                                                  backgroundColor: Colors.green,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            onTap: () async {
                                              // SharedPreferences prefs =
                                              //     await SharedPreferences
                                              //         .getInstance();
                                              // setState(() {
                                              // var _update =
                                              //     _jsonData.splice(i, 1);

                                              // prefs.setString(
                                              //     'cart',
                                              //     jsonDecode(_update)
                                              //         .toString());
                                              // });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // food image container end
                              ],
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                        // print(snapshot.data);
                      }),
                );
              })
        ]),
      )),
    );
  }

  Future<String> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataInitial = prefs.getString('cart');
    if (dataInitial == null) {
      return null;
    }
    return dataInitial;
  }
}
