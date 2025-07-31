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
import 'package:warehouse_subul/features/get_all_parcels/data/data_source/get_all_parcels_data_source/get_all_parcels_remote_data_source.dart';
import 'package:warehouse_subul/features/get_all_parcels/data/repos/get_all_parcels_repo_impl/get_all_parcels_repo_impl.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/repos/get_all_parcels_repo/get_all_parcels_repo.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/use_case/get_all_parcels_use_case/get_all_parcels_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/create_parcel_data_source/create_parcel_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/create_parcel_item_data_source/create_parcel_item_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_allowed_content_data_source/get_allowed_content_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_drivers_data_source/get_drivers_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_parcel_items_data_source/get_parcel_items_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_shipment_details_data_source/get_shipment_details_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_shipment_parcels_data_source/get_shipment_parcels_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/get_shipments_in_process_data_source/get_shipment_in_process_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/update_shipment_destenation_data_source/update_shipment_destenation_remote_date_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/update_shipment_for_delivery_data_source/update_shipment_for_delivery_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/data_source/update_shipment_origin_country_data_source/update_shipment_origin_country_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/create_parcel_item_repo_impl/create_parcel_item_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/create_parcel_repo_impl/create_parcel_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_allowed_content_repo_impl/get_allowed_content_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_drivers_repo_impl/get_drivers_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_parcel_items_repo_impl/get_parcel_items_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_shipment_details_repo_impl/get_shipment_details_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_shipment_parcels_repo_impl/get_shipment_parcels_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/get_shipments_in_process_repo_impl/get_shipments_in_process_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/update_shipment_destenation_repo_impl/update_shipment_destenation_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/update_shipment_for_delivery_repo_impl/update_shipment_for_delivery_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/repos/update_shipment_origin_country_repo_impl/update_shipment_origin_country_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/create_parcel_item_repo/create_parcel_item_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/create_parcel_repo/create_parcel_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_allowed_content_repo/get_allowed_content_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_drivers_repo/get_drivers_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_parcel_items_repo/get_parcel_items_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_shipment_details_repo/get_shipment_details_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_shipment_parcels_repo/get_shipment_parcels_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_shipments_in_process_repo/get_shipments_in_process_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/update_shipment_destenation_country_repo/update_shipment_destenation_country_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/update_shipment_for_delivery_repo/update_shipment_for_delivery_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/update_shipment_origin_country_repo/update_shipment_origin_country_repo.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/create_parcel_item_use_case/create_parcel_item_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/create_parcel_use_case/create_parcel_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_allowed_content_use_case/get_allowed_content_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_drivers_use_case/get_drivers_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_parcel_items_use_case/get_parcel_items_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_shipment_details_use_case/get_shipment_details_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_shipment_parcels_use_case/get_shipment_parcels_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_shipments_in_process_use_case/get_shipments_in_process_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_destenation_country_use_case/update_shipment_destenation_country_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_for_delivery_use_case/update_shipment_for_delivery_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_origin_country_use_case/update_shipment_origin_use_case.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/data/data_source/get_shipments_in_the_way_data_source/get_shipments_in_the_way_remote_data_source.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/data/repos/get_shipments_in_the_way_repo_impl/get_shipments_in_the_way_repo_impl.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/domain/repos/get_shipments_in_the_way_repo/get_shipments_in_the_way_repo.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/domain/use_case/get_shipments_in_the_way_use_case/get_shipments_in_the_way_use_case.dart';
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
    () => CreateShipmentUseCase(sl.get<CreateShipmentRepo>()),
  );

  // get shipments in proccess
    sl.registerLazySingleton<GetShipmentInProcessRemoteDataSource>(
    ()=> GetShipmentInProcessRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetShipmentsInProcessRepo>(
    ()=> GetShipmentsInProcessRepoImpl(sl.get<GetShipmentInProcessRemoteDataSource>())
  );
  sl.registerLazySingleton<GetShipmentsInProcessUseCase>(
    () => GetShipmentsInProcessUseCase(getShipmentsInProcessRepo: sl.get<GetShipmentsInProcessRepo>()),
  );
   // update shipment origin country
    sl.registerLazySingleton<UpdateShipmentOriginCountryRemoteDataSource>(
    ()=> UpdateShipmentOriginCountryRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<UpdateShipmentOriginCountryRepo>(
    ()=> UpdateShipmentOriginCountryRepoImpl(sl.get<UpdateShipmentOriginCountryRemoteDataSource>())
  );
  sl.registerLazySingleton<UpdateShipmentOriginUseCase>(
    () => UpdateShipmentOriginUseCase(sl.get<UpdateShipmentOriginCountryRepo>()),
  );

  // update shipment destenation country
    sl.registerLazySingleton<UpdateShipmentDestenationRemoteDateSource>(
    ()=> UpdateShipmentDestenationRemoteDateSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<UpdateShipmentDestenationCountryRepo>(
    ()=> UpdateShipmentDestenationRepoImpl(sl.get<UpdateShipmentDestenationRemoteDateSource>())
  );
  sl.registerLazySingleton<UpdateShipmentDestenationCountryUseCase>(
    () => UpdateShipmentDestenationCountryUseCase(sl.get<UpdateShipmentDestenationCountryRepo>()),
  );


  
  // get drivers
    sl.registerLazySingleton<GetDriversRemoteDataSource>(
    ()=> GetDriversRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetDriversRepo>(
    ()=> GetDriversRepoImpl(sl.get<GetDriversRemoteDataSource>())
  );
  sl.registerLazySingleton<GetDriversUseCase>(
    () => GetDriversUseCase(sl.get<GetDriversRepo>()),
  );

// update shipment for delivery
    sl.registerLazySingleton<UpdateShipmentForDeliveryRemoteDataSource>(
    ()=> UpdateShipmentForDeliveryRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<UpdateShipmentForDeliveryRepo>(
    ()=> UpdateShipmentForDeliveryRepoImpl(sl.get<UpdateShipmentForDeliveryRemoteDataSource>())
  );
  sl.registerLazySingleton<UpdateShipmentForDeliveryUseCase>(
    () => UpdateShipmentForDeliveryUseCase(sl.get<UpdateShipmentForDeliveryRepo>()),
  );

  // get shipment details
    sl.registerLazySingleton<GetShipmentDetailsRemoteDataSource>(
    ()=> GetShipmentDetailsRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetShipmentDetailsRepo>(
    ()=> GetShipmentDetailsRepoImpl(sl.get<GetShipmentDetailsRemoteDataSource>())
  );
  sl.registerLazySingleton<GetShipmentDetailsUseCase>(
    () => GetShipmentDetailsUseCase(sl.get<GetShipmentDetailsRepo>()),
  );



// get all parcels
    sl.registerLazySingleton<GetAllParcelsRemoteDataSource>(
    ()=> GetAllParcelsRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetAllParcelsRepo>(
    ()=> GetAllParcelsRepoImpl
    (sl.get<GetAllParcelsRemoteDataSource>())
  );
  sl.registerLazySingleton<GetAllParcelsUseCase>(
    () => GetAllParcelsUseCase(sl.get<GetAllParcelsRepo>()),
  );

  // get shipment parcels
    sl.registerLazySingleton<GetShipmentParcelsRemoteDataSource>(
    ()=> GetShipmentParcelsRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetShipmentParcelsRepo>(
  () => GetShipmentParcelsRepoImpl(
    sl.get<GetShipmentParcelsRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<GetShipmentParcelsUseCase>(
    () => GetShipmentParcelsUseCase(sl.get<GetShipmentParcelsRepo>()),
  );







  // create parcel
    sl.registerLazySingleton<CreateParcelRemoteDataSource>(
    ()=> CreateParcelRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<CreateParcelRepo>(
  () => CreateParcelRepoImpl(
    sl.get<CreateParcelRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<CreateParcelUseCase>(
    () => CreateParcelUseCase(sl.get<CreateParcelRepo>()),
  );


  // create parcel item
    sl.registerLazySingleton<CreateParcelItemRemoteDataSource>(
    ()=> CreateParcelItemRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<CreateParcelItemRepo>(
  () => CreateParcelItemRepoImpl(
    sl.get<CreateParcelItemRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<CreateParcelItemUseCase>(
    () => CreateParcelItemUseCase(sl.get<CreateParcelItemRepo>()),
  );



  // get allowed content
    sl.registerLazySingleton<GetAllowedContentRemoteDataSource>(
    ()=> GetAllowedContentRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetAllowedContentRepo>(
  () => GetAllowedContentRepoImpl(
    sl.get<GetAllowedContentRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<GetAllowedContentUseCase>(
    () => GetAllowedContentUseCase(sl.get<GetAllowedContentRepo>()),
  );



  // get parcel items
    sl.registerLazySingleton<GetParcelItemsRemoteDataSource>(
    ()=> GetParcelItemsRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetParcelItemsRepo>(
  () => GetParcelItemsRepoImpl(
    sl.get<GetParcelItemsRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<GetParcelItemsUseCase>(
    () => GetParcelItemsUseCase(sl.get<GetParcelItemsRepo>()),
  );


  
  // get shipmetns in the way
    sl.registerLazySingleton<GetShipmentsInTheWayRemoteDataSource>(
    ()=> GetShipmentsInTheWayRemoteDataSourceImpl(sl.get<ApiService>())
  );
  sl.registerLazySingleton<GetShipmentsInTheWayRepo>(
  () => GetShipmentsInTheWayRepoImpl(
    sl.get<GetShipmentsInTheWayRemoteDataSource>() 
  ),
);

  sl.registerLazySingleton<GetShipmentsInTheWayUseCase>(
    () => GetShipmentsInTheWayUseCase(sl.get<GetShipmentsInTheWayRepo>()),
  );
}
