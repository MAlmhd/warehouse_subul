import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/parcel_entity/parcel_entity.dart';

abstract class GetAllParcelsRepo {
  Future<Either<Failure, List<ParcelEntity>>> getAllParcels();
}
