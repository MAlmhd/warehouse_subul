import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/specific_parcels_of_shipment_entity/specific_parcels_of_shipment_entity.dart';

abstract class GetShipmentParcelsRepo {
  Future<Either<Failure, List<SpecificParcelsOfShipmentEntity>>>
  getShipmentParcels({required int shipmentId});
}
