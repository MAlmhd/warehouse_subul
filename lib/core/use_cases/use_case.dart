import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call([P params]);
}

class NoParam {}