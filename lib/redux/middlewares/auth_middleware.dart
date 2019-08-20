import 'dart:convert';
import 'package:flutter_demo/services/local_storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

import 'package:flutter_demo/locator.dart';
import 'package:flutter_demo/model/action.dart';
import 'package:flutter_demo/model/app_state.dart';
import 'package:flutter_demo/model/login_data.dart';
import 'package:flutter_demo/model/user.dart';
import 'package:flutter_demo/redux/actions.dart';
import 'package:flutter_demo/services/navigation_service.dart';

class AuthMiddleware extends MiddlewareClass<AppState>{
  AuthMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is Action) {
      switch (action.type) {
        case "DO_LOGIN":
          doLogin(store, action.payload);
          break;
        case "DO_LOGOUT":
          doLogout(store);
          break;
        default:
          next(action);
      }

      return;
    }

    next(action);
  }
}

void doLogin(Store<AppState> store, LoginData loginData) async {
  store.dispatch(new SetIsLoading(true));

  String url = "${DotEnv().env["API_URL"]}/auth/sign_in";
  var body = new Map<String, dynamic>();
  body["email"] = loginData.email;
  body["password"] = loginData.password;

  http.Response res = await http.post(
    url,
    body: body,
  );

  Map response = json.decode(res.body);

  if (response['data'] != null) {
    var storageService = locator<LocalStorageService>();
    store.dispatch(new SetUserData(User.fromJson(response['data'])));

    // Save session data
    storageService.saveToDisk('access-token', res.headers["access-token"]);
    storageService.saveToDisk('token-type', res.headers["token-type"]);
    storageService.saveToDisk('uid', res.headers["uid"]);
    storageService.saveToDisk('expiry', res.headers["expiry"]);

    // Navigate to dashboard
    locator<NavigationService>().replaceTo('/dashboard');
  } else {
    store.dispatch(new SetLoginError(response['errors'][0]));
  }
}

void doLogout(Store<AppState> store) async {
  var storageService = locator<LocalStorageService>();
  // Remove session data
  storageService.removeFromDisk('access-token');
  storageService.removeFromDisk('token-type');
  storageService.removeFromDisk('uid');
  storageService.removeFromDisk('expiry');

  locator<NavigationService>().replaceTo('/login');
}
