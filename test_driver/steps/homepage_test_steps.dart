import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TestHomePage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String restaurent) async {
    final restaurentkey = find.byValueKey(restaurent);
    await FlutterDriverUtils.isPresent(world.driver, restaurentkey);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string}");
}
