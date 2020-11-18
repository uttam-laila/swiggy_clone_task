import 'package:flutter/material.dart';

Widget dishListItem({
  String imageUrl,
  String name,
  String price,
  String veg,
}) =>
    Container(
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
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image(
                          image: NetworkImage(
                              "https://github.com/uttam-laila/foodAppTask/blob/master/assets/icons/nvicon.png?raw=true"),
                          color: veg == "1" ? Colors.green : Colors.red,
                        ),
                      )),
                  Text(name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff7e808c),
                        fontWeight: FontWeight.w600,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "$price",
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
            child: Image(
              height: 80,
              width: 80,
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          // food image container end
        ],
      ),
    );
