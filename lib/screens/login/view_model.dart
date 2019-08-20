import 'package:flutter_demo/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_demo/model/app_state.dart';

class LoginViewModel {
  final Function login;
  final String loginError;
  final bool isLoading;

  LoginViewModel({
    this.login,
    this.loginError,
    this.isLoading,
  });

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
      login: (loginData) {
        store.dispatch(new DoLogin(loginData));
      },
      loginError: store.state.loginError,
      isLoading: store.state.isLoading,
    );
  }
}
