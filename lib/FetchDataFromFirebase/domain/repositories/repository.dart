import 'package:androidapprelease/FetchDataFromFirebase/domain/entities/user_entity.dart';
import 'package:firebase_database/firebase_database.dart';

import '../entities/attendance_entity.dart';

abstract class Repository{
  Future<DatabaseReference> getAttendance ();
  Future<DatabaseReference> getUsers ();
  // Future<dynamic> readDataFromDataBase ();
}

