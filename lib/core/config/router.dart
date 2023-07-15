import 'package:flutter/material.dart';
import '../../FetchDataFromFirebase/presentation/screens/all_data_screen.dart';
import '../../FetchDataFromFirebase/presentation/screens/allbranches.dart';
import '../../FetchDataFromFirebase/presentation/screens/attendance_screen.dart';
import '../../FetchDataFromFirebase/presentation/screens/home.dart';
import '../../FetchDataFromFirebase/presentation/screens/users_screen.dart';



const String homeRoute='/';
const String allBranchesRoute='/allBranchesRoute';
const String attendanceScreenRoute='/attendanceScreenRoute';
const String usersScreenRoute='/usersScreenRoute';
const String allDataScreenRoute='/allDataScreenRoute';


class NavigationRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());
      case allBranchesRoute:
        return MaterialPageRoute(builder: (_) => const AllBranches());
      case usersScreenRoute:
        return MaterialPageRoute(builder: (_) => const UsersScreen());
      case attendanceScreenRoute:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());
      case allDataScreenRoute:
        return MaterialPageRoute(builder: (_) => const AllDataScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}