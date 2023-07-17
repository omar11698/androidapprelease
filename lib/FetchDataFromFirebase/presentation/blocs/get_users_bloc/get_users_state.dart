part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  const GetUsersState();
}

class GetUsersInitial extends GetUsersState {
  @override
  List<Object> get props => [];
}
class GetUsersSuccess extends GetUsersState {
  final DatabaseReference getDataReference;
  final List<Branch> listOfBranch;
  const GetUsersSuccess( {required this.getDataReference,required this.listOfBranch,});
  @override
  List<Object> get props => [getDataReference,listOfBranch];
}
class GetUsersFailed extends GetUsersState {
  @override
  List<Object> get props => [];
}
class GetUsersLoading extends GetUsersState {
  @override
  List<Object> get props => [];
}


