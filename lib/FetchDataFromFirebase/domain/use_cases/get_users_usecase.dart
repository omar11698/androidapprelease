import 'package:androidapprelease/FetchDataFromFirebase/domain/repositories/repository.dart';
import 'package:firebase_database/firebase_database.dart';

class GetUsersUseCase{
final Repository repository;

GetUsersUseCase({required this.repository});

Future<DatabaseReference> call ()async{
  return await repository.getUsers();
}



}