part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  const GetUsersState();
}

class GetUsersInitial extends GetUsersState {
  @override
  List<Object> get props => [];
}
class GetUsersSuccess extends GetUsersState {
  @override
  List<Object> get props => [];
}
class GetUsersFailed extends GetUsersState {
  @override
  List<Object> get props => [];
}


