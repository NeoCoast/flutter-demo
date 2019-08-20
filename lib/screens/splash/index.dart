import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_demo/services/local_storage_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_demo/locator.dart';
import 'package:flutter_demo/services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin<SplashScreen> {
  Timer _timer;

  @override
  void afterFirstLayout(BuildContext context) {
    var localStorage = locator<LocalStorageService>();
    var token = localStorage.getFromDisk('access-token');
    var expiry = localStorage.getFromDisk('expiry');
    print("$token, $expiry");

    _timer = new Timer(Duration(seconds: 2), () {
      if (token != null && expiry != null) {
        locator<NavigationService>().replaceTo('/dashboard');
      } else {
        locator<NavigationService>().replaceTo('/login');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Stack(
          children: <Widget>[
            Container(
              color: Theme.of(context).colorScheme.primary,
            ),
            Center(
              child: SpinKitCubeGrid(
                color: Colors.white,
                size: 80,
              ),
            ),
          ],
        )
      ),
    );
  }
}
