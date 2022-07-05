import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/config/config.dart';

import 'get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String environment) {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
          // connectTimeout: Configuration.connectTimeout,
          // receiveTimeout: Configuration.receiveTimeout,
          ),
    )..interceptors.add(
        LogInterceptor(responseBody: true),
      ),
  );
  $initGetIt(getIt, environment: environment);
}
