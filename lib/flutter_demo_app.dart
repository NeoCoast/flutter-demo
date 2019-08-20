import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_demo/locator.dart';
import 'package:flutter_demo/model/app_state.dart';
import 'package:flutter_demo/screens/splash/index.dart';
import 'package:flutter_demo/screens/login/index.dart';
import 'package:flutter_demo/screens/dashboard/index.dart';
import 'package:flutter_demo/services/navigation_service.dart';

class FDApp extends StatefulWidget {
  final Store<AppState> store;

  FDApp(this.store);

  @override
  _FDAppState createState() => _FDAppState();
}

class _FDAppState extends State<FDApp> {
  final Color primaryColor = Color(0xff123456);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: "Flutter Demo App",
        theme: ThemeData(
          colorScheme: ColorScheme.dark().copyWith(
            primary: primaryColor,
            secondary: Color(0xff272d3a),
          ),
          hintColor: Colors.white,
          accentColor: primaryColor,
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: SplashScreen(),
        initialRoute: '/',
        routes: {
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/login': (context) => Login(),
          '/dashboard': (context) => Dashboard(),
        },
      ),
    );
  }
}
