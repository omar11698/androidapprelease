import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:androidapprelease/core/config/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FetchDataFromFirebase/presentation/blocs/get_attendance_bloc/get_attendance_bloc.dart';
import 'FetchDataFromFirebase/presentation/screens/home.dart';
import 'core/config/dependency_injection.dart';
import 'core/config/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => GetAttendanceBloc(getAttendanceUseCase: instance())..add(const GettingAttendanceEvent())),
        BlocProvider(
        create: (context) => GetUsersBloc(getUssersUseCase: instance())..add(const GettingUsersEvent())),



      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildThemeData,
        onGenerateRoute: NavigationRouter.generateRoute,
        initialRoute: branchesGridViewRoute,
      ),
    );
  }


}


