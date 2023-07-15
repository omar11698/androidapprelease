import 'package:androidapprelease/core/config/router.dart';
import 'package:flutter/material.dart';

class AllBranches extends StatelessWidget {
  const AllBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              buildUsersButtonExpanded(context),
              buildAttendanceButtonExpanded(context),
            ],
          )
        ],
      ),
    );
  }

  Expanded buildAttendanceButtonExpanded(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, attendanceScreenRoute),
            child: const Text(
              'Attendance',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }

  Expanded buildUsersButtonExpanded(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, usersScreenRoute),
            child: const Text(
              'Users',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
