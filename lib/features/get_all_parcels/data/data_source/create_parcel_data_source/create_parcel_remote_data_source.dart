import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/data/auth_local_data_source.dart';
import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_all_parcels/data/models/create_parcel_model/create_parcel_model.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/create_parcel_entity/create_parcel_entity.dart';

abstract class CreateParcelRemoteDataSource {
  Future<CreateParcelEntity> createParcel({
    required int id,
    required String actualWeight,
    required String specialActualWeight,
    required String normalActualWeight,
    required String specialDimensionalWeight,
    required String normalDimensionalWeight,
    required String length,
    required String width,
    required String height,

    required String brandType,
    required String isFragile,
    required String needsRepacking,
    required String notes,
    required String printNotes,
    required XFile scalePhotoUpload,
  });
}

class CreateParcelRemoteDataSourceImpl implements CreateParcelRemoteDataSource {
  final ApiService _apiService;

  CreateParcelRemoteDataSourceImpl(this._apiService);
  @override
  Future<CreateParcelEntity> createParcel({
    required int id,
    required String actualWeight,
    required String specialActualWeight,
    required String normalActualWeight,
    required String specialDimensionalWeight,
    required String normalDimensionalWeight,
    required String length,
    required String width,
    required String height,
    required String brandType,
    required String isFragile,
    required String needsRepacking,
    required String notes,
    required String printNotes,
    required XFile scalePhotoUpload,
  }) async{
    final token = await sl.get<AuthLocalDataSource>().getToken();
   final scalePhoto = MultipartFile.fromBytes(
      await scalePhotoUpload.readAsBytes(),
      filename: scalePhotoUpload.name,
    );
   
    FormData formData = FormData.fromMap({
      'actual_weight': actualWeight,
      'special_actual_weight': specialActualWeight,
      'normal_actual_weight': normalActualWeight,
      'length': length,
      'width': width,
      'height': height,
      'scale_photo_upload': scalePhoto,
      'brand_type': brandType,
      'is_fragile': isFragile,
      'needs_repacking': needsRepacking,
      'notes': notes,
      'print_notes': printNotes,
      'special_dimensional_weight': specialDimensionalWeight,
      'normal_dimensional_weight': normalDimensionalWeight,
    });

    var response = await _apiService.post(
      endPoint: 'create/parcel/$id',
      headers: {'Authorization': 'Bearer $token'},
      data: formData,
    );

    CreateParcelEntity entity = CreateParcelModel.fromJson(
      response,
    );

    return entity;
  }
}
