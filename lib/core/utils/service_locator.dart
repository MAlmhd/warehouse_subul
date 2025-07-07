import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:warehouse_subul/core/data/auth_local_data_source.dart';
import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/features/create_shipment/data/data_source/create_shipment_data_source/create_shipment_remote_data_source.dart';
import 'package:warehouse_subul/features/create_shipment/data/data_source/get_countries_data_source/get_countries_remote_data_source.dart';
import 'package:warehouse_subul/features/create_shipment/data/data_source/get_users_data_source/get_users_remote_data_source.dart';
import 'package:warehouse_subul/features/create_shipment/data/repos/create_shipment_repo_impl/create_shipment_repo_impl.dart';
import 'package:warehouse_subul/features/create_shipment/data/repos/get_countries_repo_impl/get_countries_repo_impl.dart';
import 'package:warehouse_subul/features/create_shipment/data/repos/get_user_repo_impl/get_users_repo_impl.dart';
import 'package:warehouse_subul/features/create_shipment/domain/repos/create_shipment_repo/create_shipment_repo.dart';
import 'package:warehouse_subul/features/create_shipment/domain/repos/get_countries_repo/get_countries_repo.dart';
import 'package:warehouse_subul/features/create_shipment/domain/repos/get_users_repo/get_users_repo.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/create_shipment_use_case/create_shipment_use_case.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/get_countries_use_case/get_countries_use_case.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/get_users_use_case/get_user_use_case.dart';
import 'package:warehouse_subul/features/sign_in/data/data_sources/sign_in_remote_data_source.dart';
import 'package:warehouse_subul/features/sign_in/data/repos/sign_in_repo_impl.dart';
import 'package:warehouse_subul/features/sign_in/domain/repos/sign_in_repo.dart';
import 'package:warehouse_subul/features/sign_in/domain/use_cases/sign_in_use_case.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // Core
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: sl<FlutterSecureStorage>()),
  );

  // sign in

  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(
      signInRemoteDataSource: sl<SignInRemoteDataSource>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(sl<SignInRepo>()),
  );

  // get users
  sl.registerLazySingleton<GetUsersRemoteDataSource>(
    ()=> GetUsersRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetUsersRepo>(
    ()=> GetUsersRepoImpl(sl.get<GetUsersRemoteDataSource>())
  );
  sl.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(sl<GetUsersRepo>()),
  );

  // get countries
  sl.registerLazySingleton<GetCountriesRemoteDataSource>(
    ()=> GetCountriesRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetCountriesRepo>(
    ()=> GetCountriesRepoImpl(sl.get<GetCountriesRemoteDataSource>())
  );
  sl.registerLazySingleton<GetCountriesUseCase>(
    () => GetCountriesUseCase(sl<GetCountriesRepo>()),
  );
  // create shipment
  sl.registerLazySingleton<CreateShipmentRemoteDataSource>(
    ()=> CreateShipmentRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<CreateShipmentRepo>(
    ()=> CreateShipmentRepoImpl(sl.get<CreateShipmentRemoteDataSource>())
  );
  sl.registerLazySingleton<CreateShipmentUseCase>(
    () => CreateShipmentUseCase(sl<CreateShipmentRepo>()),
  );
}
