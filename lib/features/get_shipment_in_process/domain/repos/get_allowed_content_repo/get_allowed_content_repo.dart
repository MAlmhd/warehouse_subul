import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/allowed_content_entity/allowed_content_entity.dart';

abstract class GetAllowedContentRepo {
  Future<Either<Failure, List<AllowedContentEntity>>> getAllowedContent();
}
