part of 'get_attendance_bloc.dart';

abstract class GetAttendanceState extends Equatable {
  const GetAttendanceState();
}

class GetAttendanceInitial extends GetAttendanceState {
  @override
  List<Object> get props => [];
}class GetAttendanceSuccess extends GetAttendanceState {
  @override
  List<Object> get props => [];
}class GetAttendanceFailed extends GetAttendanceState {
  @override
  List<Object> get props => [];
}class GetAttendanceLoadingState extends GetAttendanceState {
  @override
  List<Object> get props => [];
}
