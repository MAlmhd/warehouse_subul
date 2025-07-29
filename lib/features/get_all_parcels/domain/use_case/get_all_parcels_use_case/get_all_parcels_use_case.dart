import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/entities/parcel_entity/parcel_entity.dart';
import 'package:warehouse_subul/features/get_all_parcels/domain/repos/get_all_parcels_repo/get_all_parcels_repo.dart';

class GetAllParcelsUseCase extends UseCase<List<ParcelEntity>, NoParam> {
  final GetAllParcelsRepo getAllParcelsRepo;

  GetAllParcelsUseCase(this.getAllParcelsRepo);
  @override
  Future<Either<Failure, List<ParcelEntity>>> call([NoParam? params]) async {
    return await getAllParcelsRepo.getAllParcels();
  }
}
