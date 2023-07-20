import 'package:equatable/equatable.dart';

import '../../data/models/attendance_model.dart';

enum AttendanceStatus{
  checkedIn,
  checkedOut;
}

class Attendance extends Equatable{
  final String dayDate;
  final int number;
  final AttendanceTime attendanceTime ;
  const Attendance({required this.dayDate,required this.number, required this.attendanceTime});

  @override
  List<Object?> get props => [dayDate,number,attendanceTime];


}
