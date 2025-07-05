import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/create_shipment/domain/entities/country_entity/country_entity.dart';

abstract class GetCountriesRepo {
  Future<Either<Failure, List<CountryEntity>>> getCountries();
}
