part of 'get_attendance_bloc.dart';

abstract class GetAttendanceEvent extends Equatable {
  const GetAttendanceEvent();
}
 class GettingAttendanceEvent extends GetAttendanceEvent {
  const GettingAttendanceEvent();

  @override
  List<Object?> get props => [];
}