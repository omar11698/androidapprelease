import 'package:androidapprelease/FetchDataFromFirebase/domain/use_cases/get_users_usecase.dart';
import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_attendance_bloc/get_attendance_bloc.dart';
import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../FetchDataFromFirebase/data/data_sources/remote_data_source/firebase.dart';
import '../../FetchDataFromFirebase/data/repositories/repository_imp.dart';
import '../../FetchDataFromFirebase/domain/repositories/repository.dart';
import '../../FetchDataFromFirebase/domain/use_cases/get_attendance_usecase.dart';


final instance = GetIt.instance;
Future<void> intiAppModule()async{

// remote data source
  instance.registerLazySingleton<GetDataFromFireBase>(
          () =>GetDataFromFireBaseImpl());
// repository
instance.registerLazySingleton<Repository>(() => RepositoryImpl(getDataFromFireBase: instance()));
}

initGetAttendanceModule() {
  if (!GetIt.I.isRegistered<GetAttendanceUseCase>()) {
    instance
        .registerFactory<GetAttendanceUseCase>(() => GetAttendanceUseCase(repository: instance()));
    instance
        .registerFactory<GetAttendanceBloc>(() => GetAttendanceBloc(getAttendanceUseCase:instance()));
  }
}

initGetUsersModule() {
  if (!GetIt.I.isRegistered<GetUsersUseCase>()) {
    instance
        .registerFactory<GetUsersUseCase>(() => GetUsersUseCase(repository: instance()));
    instance
        .registerFactory<GetUsersBloc>(() => GetUsersBloc(getUssersUseCase:instance(),));

  }
}
