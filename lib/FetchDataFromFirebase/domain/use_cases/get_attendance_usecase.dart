import 'package:androidapprelease/FetchDataFromFirebase/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

class GetAttendanceUseCase{
final Repository repository;
GetAttendanceUseCase({required this.repository});

Future<DatabaseReference> call ()async{
  return await repository.getAttendance();
}

}
