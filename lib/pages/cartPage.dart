import 'package:flutter/material.dart';
import 'package:online_service_app/bloc/incrementItem.dart';
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
                  return Text(
                    'Your Cart Items: ${snapshot.data}',
                  );
                }),
            StreamBuilder<int>(
                stream: cartPriceBloc.valueStream,
                initialData: pricebloc,
                builder: (context, snapshot) {
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
