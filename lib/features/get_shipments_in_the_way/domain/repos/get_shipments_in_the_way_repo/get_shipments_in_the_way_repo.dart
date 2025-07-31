import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/domain/entity/shipment_in_the_way_entity/shipment_in_the_way_entity.dart';

abstract class GetShipmentsInTheWayRepo {
  Future<Either<Failure, List<ShipmentInTheWayEntity>>> getShipmentsInTheWay();
}
