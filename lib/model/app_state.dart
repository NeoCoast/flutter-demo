import 'package:meta/meta.dart';
import 'package:flutter_demo/model/user.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isLogged;
  final User userData;
  final String loginError;

  AppState({
    @required this.isLoading,
    @required this.isLogged,
    @required this.userData,
    @required this.loginError
  });

  factory AppState.initial(){
    return AppState(
      isLoading: false,
      isLogged: false,
      userData: new User(),
      loginError: "",
    );
  }

  AppState copyWith({
    bool isLoading,
    bool isLogged,
    User userData,
    String loginError,
  }){
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      isLogged: isLogged ?? this.isLogged,
      userData: userData ?? this.userData,
      loginError: loginError ?? this.loginError,
    );
  }

  @override
  String toString() {
    return "isLoading: $isLoading \n" +
           "isLogged: $isLogged \n" +
           "loginError: $loginError \n" +
           "userData: $userData";
  }
}
