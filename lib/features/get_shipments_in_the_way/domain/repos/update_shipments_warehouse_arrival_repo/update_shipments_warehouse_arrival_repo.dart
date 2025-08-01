import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipments_in_the_way/domain/entity/update_shipments_warehouse_arrival_entity/update_shipments_warehouse_arrival_entity.dart';

abstract class UpdateShipmentsWarehouseArrivalRepo {
  Future<Either<Failure, UpdateShipmentsWarehouseArrivalEntity>>
  updateShipment({required int id,required XFile image,});
}
