import 'package:flutter/material.dart';
import 'package:flutter_demo/model/app_state.dart';
import 'package:flutter_demo/screens/dashboard/view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, DashboardViewModel>(
      onInit: (store) {},
      converter: (store) => DashboardViewModel.fromStore(store),
      builder: (_, viewModel) => Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello user!',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                ),
              ),
              Divider(
                height: 50.0,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 40.0,
                height: 80.0,
                child: new FlatButton(
                  onPressed: () {
                    viewModel.logout();
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Text(
                    'Logout',
                    style: new TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
