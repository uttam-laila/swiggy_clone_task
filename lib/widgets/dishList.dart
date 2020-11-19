import 'package:flutter/material.dart';
// import 'package:online_service_app/bloc/incrementItem.dart';
// import 'package:online_service_app/pages/cartPage.dart';

int countbloc = 0;
int pricebloc = 0;

Widget dishListItem(
        {String imageUrl,
        String name,
        String price,
        String veg,
        BuildContext context}) =>
    Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 32,
                    width: 32,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image(
                        image: NetworkImage(
                            "https://github.com/uttam-laila/foodAppTask/blob/master/assets/icons/nvicon.png?raw=true"),
                        color: veg == "1" ? Colors.green : Colors.red,
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
                    padding: EdgeInsets.symmetric(vertical: 5),
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
                    padding: const EdgeInsets.only(top: 64.0, left: 22),
                    child: GestureDetector(
                      child: Text(
                        " ADD ",
                        style: TextStyle(
                            backgroundColor: Colors.green,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () {
                        ++countbloc;
                        pricebloc = pricebloc + int.parse(price);
                        // addValuesToBloc(countbloc, pricebloc);
                        // cartCountBloc.valueStreamSink.add(countbloc);
                        // cartPriceBloc.valueStreamSink.add(pricebloc);
                        // print(cartPriceBloc.valueStream.isEmpty);
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
