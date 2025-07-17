import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/get_shipment_details_entity/get_shipment_details_entity.dart';

abstract class GetShipmentDetailsRepo {
  Future<Either<Failure, GetShipmentDetailsEntity>> getShipmentDetails({required int shipmentId});
}
