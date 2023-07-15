enum AttendanceStatus{
  checkedIn,
  checkedOut;
}

class Attendance {
  DateTime idByDateTime;
  AttendanceStatus attendanceStatus;
  Attendance({required this.idByDateTime, required this.attendanceStatus});
}