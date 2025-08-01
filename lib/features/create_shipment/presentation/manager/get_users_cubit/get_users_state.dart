part of 'get_users_cubit.dart';

sealed class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersFailure extends GetUsersState {
  final String message;

  const GetUsersFailure(this.message);
}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final List<UserEntity> users;

  const GetUsersSuccess(this.users);
}
