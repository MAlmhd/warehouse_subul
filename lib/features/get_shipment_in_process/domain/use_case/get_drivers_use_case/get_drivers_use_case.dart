import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/driver_entity/driver_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/get_drivers_repo/get_drivers_repo.dart';

class GetDriversUseCase extends UseCase<List<DriverEntity>, NoParam> {
  final GetDriversRepo getDriversRepo;

  GetDriversUseCase(this.getDriversRepo);
  @override
  Future<Either<Failure, List<DriverEntity>>> call([NoParam? params]) async {
    return await getDriversRepo.getDrivers();
  }
}
