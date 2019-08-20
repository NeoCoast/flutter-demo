import 'package:flutter_demo/model/action.dart';
import 'package:flutter_demo/model/login_data.dart';
import 'package:flutter_demo/model/user.dart';

class DoLogin extends Action {
  DoLogin(LoginData loginData) : super("DO_LOGIN", loginData);
}

class SetLoginError extends Action {
  SetLoginError(String error) : super("SET_LOGIN_ERROR", error);
}

class SetUserData extends Action {
  SetUserData(User payload) : super("SET_USER_DATA", payload);
}

class DoLogout extends Action {
  DoLogout() : super("DO_LOGOUT", "");
}

class SetIsLogged extends Action {
  SetIsLogged(bool payload) : super("SET_IS_LOGGED", payload);
}

class SetIsLoading extends Action {
  SetIsLoading(bool payload) : super("SET_IS_LOADING", payload);
}
