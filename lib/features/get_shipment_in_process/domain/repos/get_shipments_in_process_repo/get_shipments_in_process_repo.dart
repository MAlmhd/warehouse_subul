import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/shipment_in_process_entity/shipment_in_process_entity.dart';

abstract class GetShipmentsInProcessRepo {
  Future<Either<Failure, List<ShipmentInProcessEntity>>> getShipments();
}
