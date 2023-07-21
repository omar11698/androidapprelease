import '../../domain/entities/attendance_entity.dart';

class AttendanceModel extends Attendance {
  const AttendanceModel(
      {required super.dayDate,
      required super.number,
      required super.attendanceTime});
  factory AttendanceModel.fromFireBaseJson(Map<String, dynamic> json) {
    return AttendanceModel(
        dayDate: json[0],
        number: json[0][0],
        attendanceTime: AttendanceTime(
            time: json[0][0][0], attendanceStatus: json[0][0][0]["Status"]));
  }
}

class AttendanceTime {
  final String time;
  // final AttendanceStatus attendanceStatus;
  final String attendanceStatus;
  AttendanceTime({required this.time, required this.attendanceStatus});
}

class StatusData {
  String status;

  StatusData({required this.status});

  factory StatusData.fromJson(Map<String, dynamic> json) {
    return StatusData(status: json['Status']);
  }
}

class DateStatus {
  String date;
  Map<String, StatusData> times;

  DateStatus({required this.date, required this.times});

  factory DateStatus.fromJson(Map<String, dynamic> json) {
    Map<String, StatusData> timesMap = {};
    json.forEach((key, value) {
      if (value != null && value is Map<String, dynamic>) {
        timesMap[key] = StatusData.fromJson(value);
      }
    });

    return DateStatus(date: json.keys.first, times: timesMap);
  }
}

DateStatus parseJsonToModel(Map<String, dynamic> json) {
  Map<String, DateStatus> dateStatusMap = {};

  json.forEach((key, value) {
    if (value != null) {
      if (value is List<dynamic>) {
        // Handle case for "26-12-2023": [null, ...]
        // You may want to handle this case based on your requirements
      } else if (value is Map<String, dynamic>) {
        dateStatusMap[key] = DateStatus.fromJson(value);
      }
    }
  });

  // Assuming there is only one DateStatus object in the JSON for demonstration purposes
  // You may need to handle this differently based on your actual JSON data
  return dateStatusMap.values.first;
}

class Booking {
  final String date;
  final List<Checkin> checkins;

  Booking({
    required this.date,
    required this.checkins,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      date: json['date'],
      checkins: List<Checkin>.from(
        json['checkins'].map(
          (checkin) => Checkin.fromJson(checkin),
        ),
      ),
    );
  }
}

class Checkin {
  final String time;
  final String status;

  Checkin({
    required this.time,
    required this.status,
  });

  factory Checkin.fromJson(Map<String, dynamic> json) {
    return Checkin(
      time: json['time'],
      status: json['Status'],
    );
  }
}
