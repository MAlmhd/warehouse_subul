import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/get_parcel_items_entity/get_parcel_items_entity.dart';

abstract class GetParcelItemsRepo {
  Future<Either<Failure, List<GetParcelItemsEntity>>> getParcelItems({required int id});
}
