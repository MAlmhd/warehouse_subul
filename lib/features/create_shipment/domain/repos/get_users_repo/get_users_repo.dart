import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/create_shipment/domain/entities/user_entity/user_entity.dart';

abstract class GetUsersRepo {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
