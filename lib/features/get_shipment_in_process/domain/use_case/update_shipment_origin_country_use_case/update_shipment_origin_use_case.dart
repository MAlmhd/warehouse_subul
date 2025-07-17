import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/core/use_cases/use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/update_origin_country_entity/update_origin_country_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/repos/update_shipment_origin_country_repo/update_shipment_origin_country_repo.dart';

class UpdateShipmentOriginUseCase
    extends UseCase<UpdateOriginCountryEntity, UpdateOriginCountryParam> {
  final UpdateShipmentOriginCountryRepo updateShipmentOriginCountryRepo;

  UpdateShipmentOriginUseCase(this.updateShipmentOriginCountryRepo);
  @override
  Future<Either<Failure, UpdateOriginCountryEntity>> call([
    UpdateOriginCountryParam? params,
  ]) async {
    return await updateShipmentOriginCountryRepo.updateCountry(
      idShipment: params!.idShipment,
      idCountry: params.idCountry,
    );
  }
}

class UpdateOriginCountryParam {
  final int idShipment;
  final int idCountry;

  UpdateOriginCountryParam({required this.idShipment, required this.idCountry});
}
