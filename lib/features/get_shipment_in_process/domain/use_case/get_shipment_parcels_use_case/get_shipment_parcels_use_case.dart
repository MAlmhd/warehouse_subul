import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/specific_parcels_of_shipment_entity/specific_parcels_of_shipment_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_shipment_parcels_repo/get_shipment_parcels_repo.dart';

class GetShipmentParcelsUseCase
    extends UseCase<List<SpecificParcelsOfShipmentEntity>, int> {
  final GetShipmentParcelsRepo getShipmentParcelsRepo;

  GetShipmentParcelsUseCase(this.getShipmentParcelsRepo);
  @override
  Future<Either<Failure, List<SpecificParcelsOfShipmentEntity>>> call([
    int? params,
  ]) async {
    return await getShipmentParcelsRepo.getShipmentParcels(shipmentId: params!);
  }
}
