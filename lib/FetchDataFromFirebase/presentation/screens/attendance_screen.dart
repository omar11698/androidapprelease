import 'package:androidapprelease/core/config/router.dart';
import 'package:flutter/material.dart';
List<DateTime> listOfDates=[DateTime.now(),DateTime.now()];
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView.builder(itemCount:listOfDates.length,itemBuilder: (BuildContext context, index){
        return ListTile(
            onTap: ()=>Navigator.pushNamed(context, allDataScreenRoute),
            leading:Card(
              child: Text(listOfDates[index].toString()),
            ) ,
        );
      }),
    );
  }
}
