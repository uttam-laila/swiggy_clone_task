import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
// import 'package:online_service_app/test_driver/steps/homepage_test_steps.dart';

import 'steps/gotoRestaurent_page.dart';
import 'steps/homepage_test_steps.dart';
import 'steps/tap_restaurant.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [TestHomePage(), TapRestaurent(), TestRestaurentPage()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
