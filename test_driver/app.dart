import 'package:flutter_driver/driver_extension.dart';
import 'package:true_vault/main.dart' as app;
import 'package:true_vault/screens/config/globals.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();
  areWeInIntegrationTest = true;
  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
