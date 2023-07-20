import 'package:androidapprelease/FetchDataFromFirebase/data/models/users.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/attendance_model.dart';

abstract class GetDataFromFireBase{
  Future<DatabaseReference> getAttendanceFromFirebase();
  Future<DatabaseReference> getUsersFromFirebase();
}
class GetDataFromFireBaseImpl extends GetDataFromFireBase{

  @override
  Future<DatabaseReference> getAttendanceFromFirebase() async{
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref("Branch1/Attendence");
    // DatabaseReference ref2 = FirebaseDatabase.instance.ref("Branch1");
    DatabaseEvent event = await ref.once();
    print(event.snapshot.value);

    // final user= await ref.get();
    // print(event.snapshot.value);
    // final mapOfUsers =user.value as Map<Object?,Object?>;
    // ref.onValue.listen((event) {
    //   // Get the data for all users.
    //   // final users = event.snapshot.value as Map<String, dynamic>;
    //   final value = Map<String, dynamic>.from(event.snapshot.value! as Map<Object?, Object?>);
    //     // print(value['Status']);
    //
    //   // Print the data for each user.
    //   value.forEach((key, value) {
    //     print(key);
    //     print(value);
    //   });
    //
    // });
    // print(mapOfUsers['1'].toString());

    return  ref;
  }

  @override
  Future<DatabaseReference> getUsersFromFirebase() async{
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref("Branch1/Users");
    DatabaseEvent event = await ref.once();
    return ref;

  }








}