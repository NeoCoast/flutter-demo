import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_demo_app.dart';
import 'package:flutter_demo/locator.dart';
import 'package:flutter_demo/redux/store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  var store = await createStore();

  await DotEnv().load();
  await setupLocator();
  runApp(new FDApp(store));
}
