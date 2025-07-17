import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/driver_entity/driver_entity.dart';

abstract class GetDriversRepo {
  Future<Either<Failure, List<DriverEntity>>> getDrivers();
}
