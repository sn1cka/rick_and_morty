// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/network_source.dart' as _i3;
import '../../data/repository_impl.dart' as _i6;
import '../../domain/repository.dart' as _i5;
import '../../presentation/pages/dashboard/characters/characters_cubit.dart'
    as _i7;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.NetworkSource>(() => _i3.NetworkSource(get<_i4.Dio>()));
  gh.factory<_i5.Repository>(() => _i6.RepositoryImpl(get<_i3.NetworkSource>()),
      registerFor: {_prod});
  gh.factory<_i7.CharactersCubit>(
      () => _i7.CharactersCubit(get<_i5.Repository>()));
  return get;
}
