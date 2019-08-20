import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_demo/model/login_data.dart';
import 'package:flutter_demo/widgets/customTextFormField/index.dart';
import 'package:flutter_demo/model/app_state.dart';
import 'package:flutter_demo/screens/login/view_model.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LoginData _loginData = new LoginData();
  FocusNode emailFocus;
  FocusNode passwordFocus;

  @override
  void initState() {
    super.initState();

    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginViewModel>(
      onInit: (store) {},
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (_, viewModel) => content(viewModel, context),
    );
  }

  Widget content(LoginViewModel viewModel, BuildContext context) =>
    new Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 30.0,
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            CustomFormField(
              focusNode: emailFocus,
              imageUrl: 'assets/space-suit.png',
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(passwordFocus);
              },
              onSaved: (String value) => this._loginData.email = value,
              placeholder: 'Email',
            ),
            Divider(height: 20),
            CustomFormField(
              focusNode: passwordFocus,
              imageUrl: 'assets/key.png',
              inputAction: TextInputAction.done,
              obscure: true,
              onFieldSubmitted: (v) {
                _formKey.currentState.save();
                viewModel.login(this._loginData);
              },
              onSaved: (String value) => this._loginData.password = value,
              placeholder: "Password",
            ),
            viewModel.loginError == "" ? (
              Divider(height: 40)
            ) : (
              Container(
                alignment: Alignment.center,
                height: 40,
                child: Text(
                  viewModel.loginError,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ),
            Row(
              children: <Widget>[
                new ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 2 - 40.0,
                  height: 80.0,
                  child: new FlatButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      viewModel.login(this._loginData);
                    },
                    color: Color(0xff232732),
                    textColor: Colors.white,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: viewModel.isLoading ? (
                        <Widget>[
                          SpinKitThreeBounce(
                            color: Colors.white,
                            size: 30,
                          )
                        ]
                      ) : (
                        <Widget>[
                          Text(
                            'Sign In',
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(Icons.arrow_right),
                        ]
                      ),
                    ),
                  ),
                ),
                new ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 2 - 40.0,
                  height: 80.0,
                  child: new FlatButton(
                    onPressed: () {},
                    color: Colors.transparent,
                    textColor: Color(0xff4d525b),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'Forgot Password?',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
}
