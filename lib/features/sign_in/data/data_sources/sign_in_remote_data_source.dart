

import 'package:warehouse_subul/core/utils/api_service.dart';
import 'package:warehouse_subul/features/sign_in/data/model/sign_in_model/sign_in_model.dart';
import 'package:warehouse_subul/features/sign_in/domain/entites/sign_in_entity.dart';

abstract class SignInRemoteDataSource {
  Future<SignInEntity> signIn({
    required String email,
    required String password,
  });
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final ApiService apiService;

  SignInRemoteDataSourceImpl(this.apiService);
  @override
  Future<SignInEntity> signIn({
    required String email,
    required String password,
  }) async {
    var data = await apiService.post(
      endPoint: 'login',
      data: {'email': email, 'password': password},
    );
    SignInEntity signInEntity = SignInModel.fromJson(data);
    return signInEntity;
  }
}
