import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapRestaurent extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String restaurent) async {
    final restaurentkey = find.byValueKey(restaurent);
    await FlutterDriverUtils.tap(world.driver, restaurentkey);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string}");
}
