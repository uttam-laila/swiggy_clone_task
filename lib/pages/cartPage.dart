import 'package:flutter/material.dart';
import 'package:online_service_app/bloc/incrementItem.dart';
import 'package:online_service_app/pages/restaurants.dart';
import 'package:online_service_app/widgets/dishList.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: cartCountBloc.valueStream,
                initialData: countbloc,
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data == 0) {
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
                  return Text(
                    'Your Cart Items: ${snapshot.data}',
                  );
                }),
            StreamBuilder<int>(
                stream: cartPriceBloc.valueStream,
                initialData: pricebloc,
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data == 0) {
                    return Container();
                  }
                  return Text(
                    'Total Amount: ${snapshot.data}',
                    // style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
