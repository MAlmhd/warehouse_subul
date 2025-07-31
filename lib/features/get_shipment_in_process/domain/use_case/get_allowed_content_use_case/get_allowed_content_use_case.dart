import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/allowed_content_entity/allowed_content_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_allowed_content_repo/get_allowed_content_repo.dart';

class GetAllowedContentUseCase
    extends UseCase<List<AllowedContentEntity>, NoParam> {
  final GetAllowedContentRepo getAllowedContentRepo;

  GetAllowedContentUseCase(this.getAllowedContentRepo);
  @override
  Future<Either<Failure, List<AllowedContentEntity>>> call([
    NoParam? params,
  ]) async {
    return await getAllowedContentRepo.getAllowedContent();
  }
}
