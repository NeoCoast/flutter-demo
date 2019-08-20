import 'package:flutter_demo/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_demo/model/app_state.dart';

class DashboardViewModel {
  final bool isLoading;
  final Function logout;

  DashboardViewModel({
    this.logout,
    this.isLoading,
  });

  static DashboardViewModel fromStore(Store<AppState> store){
    return DashboardViewModel(
      isLoading: store.state.isLoading,
      logout: () {
        store.dispatch(new DoLogout());
      },
    );
  }
}
