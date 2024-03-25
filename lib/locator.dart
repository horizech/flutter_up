import 'package:flutter_up/services/key.dart';
import 'package:flutter_up/services/up_layout.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/services/up_scaffold_helper.dart';
import 'package:flutter_up/services/up_navigation.dart';
import 'package:flutter_up/services/up_search.dart';
import 'package:flutter_up/services/up_url.dart';

GetIt _locator = GetIt.instance;

// ignore: non_constant_identifier_names
GetIt get ServiceManager => _locator;

enum FlutterUpLocators {
  upUrlService,
  upScaffoldHelperService,
  upNavigationService,
  upDialogService,
  upSearchService,
  upLayoutService,
}

setupFlutterUpLocators(List<FlutterUpLocators>? locators) {
  if (locators != null && locators.isNotEmpty) {
    for (var locator in locators) {
      if (locator == FlutterUpLocators.upUrlService) {
        _locator.registerLazySingleton(() => UpUrlService());
      }

      if (locator == FlutterUpLocators.upScaffoldHelperService) {
        _locator.registerLazySingleton(() => UpScaffoldHelperService());
      }

      if (locator == FlutterUpLocators.upNavigationService) {
        _locator.registerLazySingleton(() => UpNavigationService());
      }

      if (locator == FlutterUpLocators.upDialogService) {
        _locator.registerLazySingleton(() => UpDialogService());
      }

      if (locator == FlutterUpLocators.upSearchService) {
        _locator.registerLazySingleton(() => UpSearchService());
      }
      if (locator == FlutterUpLocators.upLayoutService) {
        _locator.registerLazySingleton(() => UpLayoutService());
      }
    }
  }
  ServiceManager.registerLazySingleton(() => KeyService());
}
