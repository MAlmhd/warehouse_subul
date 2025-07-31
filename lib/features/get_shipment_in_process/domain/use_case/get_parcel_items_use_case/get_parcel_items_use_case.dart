import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/get_parcel_items_entity/get_parcel_items_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_parcel_items_repo/get_parcel_items_repo.dart';

class GetParcelItemsUseCase extends UseCase<List<GetParcelItemsEntity>, int> {
  final GetParcelItemsRepo getParcelItemsRepo;

  GetParcelItemsUseCase(this.getParcelItemsRepo);
  @override
  Future<Either<Failure, List<GetParcelItemsEntity>>> call([
    int? params,
  ]) async {
    return await getParcelItemsRepo.getParcelItems(id: params!);
  }
}
