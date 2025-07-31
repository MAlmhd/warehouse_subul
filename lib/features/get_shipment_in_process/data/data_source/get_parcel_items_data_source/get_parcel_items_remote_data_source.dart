import 'package:warehouse_subul/core/data/auth_local_data_source.dart';
import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/data/models/get_parcel_items_model/get_parcel_items_model.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/get_parcel_items_entity/get_parcel_items_entity.dart';

abstract class GetParcelItemsRemoteDataSource {
  Future<List<GetParcelItemsEntity>> getParcelItems({required int id});
}

class GetParcelItemsRemoteDataSourceImpl
    implements GetParcelItemsRemoteDataSource {
  final ApiService _apiService;

  GetParcelItemsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<GetParcelItemsEntity>> getParcelItems({required int id})async {
     final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.get(
      endPoint: 'get/parcel-items/$id',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (data['data'] == null) {
      return [];
    }
    List<GetParcelItemsEntity> items = [];
    for (var element in data['data']) {
      items.add(GetParcelItemsModel.fromJson(element));
    }

    return items;
  }
}
