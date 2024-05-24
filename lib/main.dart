import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'models/ModelProvider.dart';
import 'screens/home.dart';
import 'amplifyconfiguration.dart';
void main() async {
  configureAmplify();
  runApp(
    MaterialApp(
      home: HomeScreen(title: "Home"),
    ),
  );
}
Future<void> configureAmplify() async {
  final api = AmplifyAPI();
  await Amplify.addPlugins([api]);

  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}



