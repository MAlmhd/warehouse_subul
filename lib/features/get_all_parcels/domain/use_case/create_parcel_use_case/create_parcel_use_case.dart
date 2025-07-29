import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/create_parcel_entity/create_parcel_entity.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/repos/create_parcel_repo/create_parcel_repo.dart';

class CreateParcelUseCase
    extends UseCase<CreateParcelEntity, CreateParcelParams> {
  final CreateParcelRepo createParcelRepo;

  CreateParcelUseCase(this.createParcelRepo);
  @override
  Future<Either<Failure, CreateParcelEntity>> call([
    CreateParcelParams? params,
  ]) async {
    return await createParcelRepo.createParcel(
      id: params!.id,
      actualWeight: params.actualWeight,
      specialActualWeight: params.specialActualWeight,
      normalActualWeight: params.normalActualWeight,
      specialDimensionalWeight: params.specialDimensionalWeight,
      normalDimensionalWeight: params.normalDimensionalWeight,
      length: params.length,
      width: params.width,
      height: params.heigh,
      brandType: params.brandType,
      isFragile: params.isFragile,
      needsRepacking: params.needsRepacking,
      notes: params.notes,
      printNotes: params.printNotes,
      scalePhotoUpload: params.scalePhotoUpload,
    );
  }
}

class CreateParcelParams {
  final int id;
  final String actualWeight;
  final String specialActualWeight;
  final String normalActualWeight;
  final String specialDimensionalWeight;
  final String normalDimensionalWeight;
  final String length;
  final String width;
  final String heigh;

  final String brandType;
  final String isFragile;
  final String needsRepacking;
  final String notes;
  final String printNotes;
  final XFile scalePhotoUpload;

  CreateParcelParams({
    required this.id,
    required this.actualWeight,
    required this.specialActualWeight,
    required this.normalActualWeight,
    required this.specialDimensionalWeight,
    required this.normalDimensionalWeight,
    required this.length,
    required this.width,
    required this.heigh,
    required this.brandType,
    required this.isFragile,
    required this.needsRepacking,
    required this.notes,
    required this.printNotes,
    required this.scalePhotoUpload,
  });
}
