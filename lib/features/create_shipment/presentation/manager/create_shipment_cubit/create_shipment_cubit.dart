import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_subul/features/create_shipment/domain/entities/response_of_create_shipment_entity/response_of_create_shipment_entity.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/create_shipment_use_case/create_shipment_use_case.dart';

part 'create_shipment_state.dart';

class CreateShipmentCubit extends Cubit<CreateShipmentState> {
  CreateShipmentCubit(this.createShipmentUseCase)
    : super(CreateShipmentInitial());
  final CreateShipmentUseCase createShipmentUseCase;

  Future<void> createShipment({
    required String type,
    required int customerId,
    required String supplierName,
    required String supplierNumber,
    required String declaredParcelsCount,
    required String notes,
    required int originCountryId,
    required int destenationCountryId,
  }) async {
    emit(CreateShipmentLoading());
    CreateShipmentParams createShipmentParams = CreateShipmentParams(
      originCountryId: originCountryId,
      destenationCountryId: destenationCountryId,
      type: type,
      customerId: customerId,
      supplierName: supplierName,
      supplierNumber: supplierNumber,
      declaredParcelsCount: declaredParcelsCount,
      notes: notes,
    );

    var data = await createShipmentUseCase.call(createShipmentParams);
    data.fold(
      (failure) {
        emit(CreateShipmentFailure(failure.message));
      },
      (success) {
        emit(CreateShipmentSuccess(success));
      },
    );
  }
}
