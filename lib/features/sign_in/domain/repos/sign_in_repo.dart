import 'package:dartz/dartz.dart';
import 'package:warehouse_subul/core/errors/failure.dart';
import 'package:warehouse_subul/features/sign_in/domain/entites/sign_in_entity.dart';

abstract class SignInRepo {
  Future<Either<Failure, SignInEntity>> signIn({required String email,required String password});
}
