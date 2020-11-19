import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_service_app/bloc/incrementItem.dart';
import 'package:online_service_app/pages/homePage.dart';
import 'package:online_service_app/services/getDishes.dart';
// import 'package:online_service_app/services/getRestaurentList.dart';
import 'package:online_service_app/widgets/dishList.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:online_service_app/widgets/restaurantLists.dart';

class DishPage extends StatefulWidget {
  final String title;
  final String type;
  final String location;

  const DishPage({Key key, this.title, this.type, this.location})
      : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Icon(Icons.location_history),
                  Text(
                    widget.title,
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
          Icon(Icons.favorite_outline),
          Padding(padding: const EdgeInsets.all(4.0), child: Icon(Icons.search))
        ],
      ),
      body: Container(
        // color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.1,
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.type),
                    Text(widget.location),
                  ],
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.2,
                child: FutureBuilder(
                  future: getDishes(),
                  builder: (BuildContext _context, AsyncSnapshot snapshot) {
                    if (snapshot != null &&
                        snapshot.hasData != null &&
                        snapshot.hasData) {
                      var _jsonResponse = jsonDecode(snapshot.data);
                      if (_jsonResponse == null) {
                        return CircularProgressIndicator();
                      }
                      return Container(
                          // height: MediaQuery.of(context).size.height / 2,
                          // width: MediaQuery.of(context).size.width,
                          child: Container(
                        child: ListView.builder(
                          itemCount: _jsonResponse.length,
                          itemBuilder: (context, i) {
                            // return Text(i.toString());
                            var imageUrl = _jsonResponse[i]["image"];
                            var name = _jsonResponse[i]["name"];
                            var veg = _jsonResponse[i]["veg"];
                            var price = _jsonResponse[i]["price"];
                            if (_jsonResponse[i] == null) {
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
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
                                                top: 64.0, left: 22),
                                            child: GestureDetector(
                                              child: Text(
                                                " ADD ",
                                                style: TextStyle(
                                                    backgroundColor:
                                                        Colors.green,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  _data = _saveData(jsonEncode(
                                                          _jsonResponse[i])
                                                      .toString());
                                                  ++countbloc;
                                                  pricebloc = pricebloc +
                                                      int.parse(price);
                                                  // addValuesToBloc(
                                                  //     countbloc, pricebloc);
                                                  cartCountBloc.valueStreamSink
                                                      .add(countbloc);
                                                  cartPriceBloc.valueStreamSink
                                                      .add(pricebloc);
                                                });
                                                // print(cartPriceBloc.valueStream.isEmpty);
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                  duration:
                                                      Duration(seconds: 4),
                                                  backgroundColor: Colors.green,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      StreamBuilder<int>(
                                                          stream: cartCountBloc
                                                              .valueStream,
                                                          initialData:
                                                              countbloc,
                                                          builder: (context,
                                                              snapshot) {
                                                            return Text(
                                                                "Cart Items: ${snapshot.data}");
                                                          }),
                                                      StreamBuilder<int>(
                                                          stream: cartPriceBloc
                                                              .valueStream,
                                                          initialData:
                                                              pricebloc,
                                                          builder: (context,
                                                              snapshot) {
                                                            return Text(
                                                                "Total Price:${snapshot.data}");
                                                          }),
                                                      GestureDetector(
                                                        child: Text(
                                                            " View Cart ",
                                                            style: TextStyle(
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen)),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return HomePage(
                                                                seselectedIndex:
                                                                    2);
                                                          }));
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ));
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
                          },
                        ),
                      ));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  },
                ),
              ),
            ],
          ),
          // All Restaurants end
        ),
      ),
    );
  }

  Future<String> _saveData(String data) async {
    // print(data.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataInitial = prefs.getString('cart');
    if (dataInitial == null) {
      prefs.setString('cart', "[$data]");
    } else {
      if (_nextData == "") {
        _nextData = dataInitial;
      } else {
        _nextData = dataInitial.substring(1, dataInitial.length - 1);
      }
      var array3 = "[$_nextData,$data]";
      print(array3);
      prefs.setString('cart', array3);
    }

    return 'saved';
  }

  var _nextData = "";
}
