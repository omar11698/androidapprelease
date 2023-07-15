import 'package:androidapprelease/FetchDataFromFirebase/domain/entities/user_entity.dart';

import '../entities/attendance_entity.dart';

abstract class Repository{

  Future<List<Attendance>> getAttendance ();
  Future<List<User>> getUsers ();
}

