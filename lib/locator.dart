import 'package:get_it/get_it.dart';

import 'package:flutter_demo/services/local_storage_service.dart';
import 'package:flutter_demo/services/navigation_service.dart';

GetIt locator = GetIt();

Future setupLocator () async {
  var localStorageInstance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageInstance);
  locator.registerLazySingleton(() => NavigationService());
}
