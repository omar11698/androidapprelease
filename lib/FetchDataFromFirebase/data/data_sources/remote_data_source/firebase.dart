import 'package:androidapprelease/FetchDataFromFirebase/data/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/attendance_model.dart';

abstract class GetDataFromFireBase{
  Future<DatabaseReference> getAttendanceFromFirebase();
  Future<UserModel> getUsersFromFirebase();
}
class GetDataFromFireBaseImpl extends GetDataFromFireBase{

  @override
  Future<DatabaseReference> getAttendanceFromFirebase() async{
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("Branch1/Attendence");
    DatabaseEvent event = await ref.once();
    return  ref;
  }

  @override
  Future<UserModel> getUsersFromFirebase() {
    // TODO: implement getUsersFromFirebase
    throw UnimplementedError();
  }

}