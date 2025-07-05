import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/create_shipment/domain/entities/response_of_create_shipment_entity/response_of_create_shipment_entity.dart';
import 'package:warehouse_subul/features/create_shipment/domain/repos/create_shipment_repo/create_shipment_repo.dart';

class CreateShipmentUseCase
    extends UseCase<ResponseOfCreateShipmentEntity, CreateShipmentParams> {
  final CreateShipmentRepo createShipmentRepo;

  CreateShipmentUseCase(this.createShipmentRepo);
  @override
  Future<Either<Failure, ResponseOfCreateShipmentEntity>> call([
    CreateShipmentParams? params,
  ]) async {
    return await createShipmentRepo.createShipment(
      type: params!.type,
      customerId: params.customerId,
      supplierName: params.supplierName,
      supplierNumber: params.supplierNumber,
      declaredParcelsCount: params.declaredParcelsCount,
      notes: params.notes,
    );
  }
}

class CreateShipmentParams {
  final String type;
  final int customerId;
  final String supplierName;
  final String supplierNumber;
  final String declaredParcelsCount;
  final String notes;

  CreateShipmentParams({
    required this.type,
    required this.customerId,
    required this.supplierName,
    required this.supplierNumber,
    required this.declaredParcelsCount,
    required this.notes,
  });
}
