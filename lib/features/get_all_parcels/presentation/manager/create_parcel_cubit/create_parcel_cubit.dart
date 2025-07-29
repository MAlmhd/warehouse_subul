import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/create_parcel_entity/create_parcel_entity.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/use_case/create_parcel_use_case/create_parcel_use_case.dart';

part 'create_parcel_state.dart';

class CreateParcelCubit extends Cubit<CreateParcelState> {
  final CreateParcelUseCase createParcelUseCase;
  CreateParcelCubit(this.createParcelUseCase) : super(CreateParcelInitial());

  Future<void> createParcel({
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
  }) async {
    CreateParcelParams createParcelParams = CreateParcelParams(
      id: id,
      actualWeight: actualWeight,
      specialActualWeight: specialActualWeight,
      normalActualWeight: normalActualWeight,
      specialDimensionalWeight: specialDimensionalWeight,
      normalDimensionalWeight: normalDimensionalWeight,
      length: length,
      width: width,
      heigh: height,
      brandType: brandType,
      isFragile: isFragile,
      needsRepacking: needsRepacking,
      notes: notes,
      printNotes: printNotes,
      scalePhotoUpload: scalePhotoUpload,
    );
    var data = await createParcelUseCase.call(createParcelParams);
  }
}
