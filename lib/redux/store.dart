import 'dart:async';
import 'package:redux/redux.dart';

import 'package:flutter_demo/model/app_state.dart';
import 'package:flutter_demo/redux/reducers.dart';
import 'package:flutter_demo/redux/middlewares/auth_middleware.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appStateReducers,
    initialState: AppState.initial(),
    middleware: [
      AuthMiddleware(),
    ],
  );
}
