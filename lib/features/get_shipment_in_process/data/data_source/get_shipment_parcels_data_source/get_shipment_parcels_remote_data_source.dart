import 'dart:developer';

import 'package:warehouse_subul/core/data/auth_local_data_source.dart';
import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/models/specific_parcels_of_shipment_model/specific_aprcels_of_shipment_model.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/specific_parcels_of_shipment_entity/specific_parcels_of_shipment_entity.dart';

abstract class GetShipmentParcelsRemoteDataSource {
  Future<List<SpecificParcelsOfShipmentEntity>> getShipmentParcels({
    required int shipmentId,
  });
}

class GetShipmentParcelsRemoteDataSourceImpl
    implements GetShipmentParcelsRemoteDataSource {
  final ApiService _apiService;

  GetShipmentParcelsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<SpecificParcelsOfShipmentEntity>> getShipmentParcels({
    required int shipmentId,
  }) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.get(
      endPoint: 'get/parcels/$shipmentId',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (data['data'] == null) {
      return [];
    }
    log("$data");
    List<SpecificParcelsOfShipmentEntity> parcels = [];
    for (var element in data['data']) {
      parcels.add(SpecificAprcelsOfShipmentModel.fromJson(element));
    }

    return parcels;
  }
}
