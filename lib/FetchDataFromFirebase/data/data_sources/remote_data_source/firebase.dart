import 'package:androidapprelease/FetchDataFromFirebase/data/models/users.dart';

import '../../models/attendance_model.dart';

abstract class GetDataFromFireBase{
  Future<AttendanceModel> getAttendanceFromFirebase();
  Future<UserModel> getUsersFromFirebase();
}
class GetDataFromFireBaseImpl extends GetDataFromFireBase{

  @override
  Future<AttendanceModel> getAttendanceFromFirebase() {
    // TODO: implement getAttendanceFromFirebase
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUsersFromFirebase() {
    // TODO: implement getUsersFromFirebase
    throw UnimplementedError();
  }

}