import 'package:flutter_driver/driver_extension.dart';
import 'package:Play_with_me/main.dart' as instrumented;
void main() {
  // enables the extension
  enableFlutterDriverExtension();

  // Calling the main() function of the app
  instrumented.main();
}