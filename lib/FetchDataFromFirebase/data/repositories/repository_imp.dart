import 'package:androidapprelease/FetchDataFromFirebase/data/data_sources/remote_data_source/firebase.dart';
import 'package:androidapprelease/FetchDataFromFirebase/domain/entities/attendance_entity.dart';
import 'package:androidapprelease/FetchDataFromFirebase/domain/entities/user_entity.dart';
import 'package:androidapprelease/FetchDataFromFirebase/domain/repositories/repository.dart';
import 'package:firebase_database/firebase_database.dart';

class RepositoryImpl extends Repository{
  final GetDataFromFireBase getDataFromFireBase;
  RepositoryImpl({required this.getDataFromFireBase});
  @override
  Future<DatabaseReference> getAttendance() async{
    return await getDataFromFireBase.getAttendanceFromFirebase();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}