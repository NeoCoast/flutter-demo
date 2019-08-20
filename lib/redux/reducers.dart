import 'package:flutter_demo/model/action.dart';
import 'package:flutter_demo/model/app_state.dart';

AppState appStateReducers(AppState state, dynamic action) {
  // We want action to be an instance of Action
  if (action is Action) {
    switch (action.type) {
      case 'SET_USER_DATA':
        return state.copyWith(
          userData: action.payload,
          isLoading: false,
        );
      case 'SET_LOGIN_ERROR':
        return state.copyWith(
          loginError: action.payload,
          isLoading: false,
        );
      case 'SET_IS_LOADING':
        return state.copyWith(isLoading: action.payload);
      default:
        return state;
    }
  }

  return state;
}
