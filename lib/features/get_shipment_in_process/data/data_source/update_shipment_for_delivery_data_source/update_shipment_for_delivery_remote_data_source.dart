import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/data/auth_local_data_source.dart';
import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/models/update_shipment_for_deleivery_model/update_shipment_for_deleivery_model.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/update_shipment_for_delivery_entity/update_shipment_for_delivery_entity.dart';

abstract class UpdateShipmentForDeliveryRemoteDataSource {
  Future<UpdateShipmentForDeliveryEntity> updateShipmentForDelivery({
    required XFile photo,
    required int idDelivery,
    required int actualParcelsCount,
    required int idShipment,
  });
}

class UpdateShipmentForDeliveryRemoteDataSourceImpl
    implements UpdateShipmentForDeliveryRemoteDataSource {
  final ApiService _apiService;

  UpdateShipmentForDeliveryRemoteDataSourceImpl(this._apiService);

  @override
  Future<UpdateShipmentForDeliveryEntity> updateShipmentForDelivery({
    required XFile photo,
    required int idDelivery,
    required int actualParcelsCount,
    required int idShipment,
  }) async{
   final token = await sl.get<AuthLocalDataSource>().getToken();
    final photoOfShipment = MultipartFile.fromBytes(
      await photo.readAsBytes(),
      filename: photo.name,
    );
   
    FormData formData = FormData.fromMap({
      'actual_parcels_count':actualParcelsCount,
      'delivery_staff_id':idDelivery,
      'shipment_photo':photoOfShipment
    });

    var response = await _apiService.post(
      endPoint: 'update/shipments/for-delivery/$idShipment',
      headers: {'Authorization': 'Bearer $token'},
      data: formData,
    );

    UpdateShipmentForDeliveryEntity entity = UpdateShipmentForDeleiveryModel.fromJson(
      response,
    );

    return entity;
  }
}
