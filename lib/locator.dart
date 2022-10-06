import 'package:get_it/get_it.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/services/up_scaffold_helper.dart';
import 'package:flutter_up/services/up_navigation.dart';
import 'package:flutter_up/services/up_search.dart';
import 'package:flutter_up/services/up_url.dart';

GetIt _locator = GetIt.instance;

// ignore: non_constant_identifier_names
GetIt get ServiceManager => _locator;

setupFlutterUpLocators() {
  _locator.registerLazySingleton(() => UpUrlService());
  _locator.registerLazySingleton(() => UpScaffoldHelperService());
  _locator.registerLazySingleton(() => UpNavigationService());
  _locator.registerLazySingleton(() => UpDialogService());
  _locator.registerLazySingleton(() => UpSearchService());
}
