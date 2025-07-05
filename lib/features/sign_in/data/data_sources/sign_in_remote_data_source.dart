

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
