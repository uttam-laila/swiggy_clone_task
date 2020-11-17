import 'package:flutter/widgets.dart';

class SwiggyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color.fromRGBO(121, 23, 23, 0.5),
          ),
        ),
      ],
    );
  }
}
