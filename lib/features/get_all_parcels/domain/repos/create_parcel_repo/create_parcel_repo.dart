import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/create_parcel_entity/create_parcel_entity.dart';

abstract class CreateParcelRepo {
  Future<Either<Failure, CreateParcelEntity>> createParcel({
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
