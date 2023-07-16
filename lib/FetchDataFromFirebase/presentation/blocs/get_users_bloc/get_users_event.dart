part of 'get_users_bloc.dart';

abstract class GetUsersEvent extends Equatable {
  const GetUsersEvent();
}
class GettingUsersEvent extends GetUsersEvent {
  const GettingUsersEvent();

  @override
  List<Object?> get props => [];
}

