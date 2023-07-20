import 'dart:convert';

import 'package:androidapprelease/core/config/router.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/attendance_model.dart';
import '../blocs/get_attendance_bloc/get_attendance_bloc.dart';

List<DateTime> listOfDates = [DateTime.now(), DateTime.now()];

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(children: [
      const SizedBox(height: 40,),
      Expanded(child: BlocBuilder<GetAttendanceBloc, GetAttendanceState>(
        builder: (context, state) {
          if(state is GetAttendanceSuccess){
            return FirebaseAnimatedList(query:state.databaseReference , itemBuilder: (context,snapshot,animation,index){
              List<String> listOfStatus=[];
              List<String> listOfKeys=[];
              for (var element in snapshot.children) {
                print(element.value.toString());
                for (var element in element.children) {
                  print(element.value.toString());
                  String status=element.child("Status").value.toString();
                  String key=element.key.toString();
                  listOfStatus.add(status);
                  listOfKeys.add(key);
                  // print(" this is the list of keys:$listOfKeys");
                  // print(" this is the list of status:$listOfStatus");
                }
              }
                // final value = Map<String, dynamic>.from(snapshot.value! as Map<Object?, Object?>);
              // DateStatus dateStatus = parseJsonToModel(json);
              // print(dateStatus.times);
              // final booking = Booking.fromJson(json);
              // print(booking);
                // Map<dynamic,dynamic> attendanceCheckedInDate=snapshot.child("${index+1}").value as Map;
                // Map<dynamic,dynamic> attendanceCheckedOutDate=snapshot.child("${index+1}").value as Map;
                //
                //
                // List listOfCheckedInDates=attendanceCheckedInDate.keys.toList();
                // // print(attendanceCheckedInDate.keys);
                // // var  attendanceCheckedInDate=snapshot.child("${index+1}").value.toString();
                // // print(attendanceCheckedInDate);
                // List listOfCheckedOutDates=attendanceCheckedOutDate.keys.toList() ;

                // leading: Text(state.databaseReference.child("26-12-2023").child("08:45").onValue.toString()),
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Card(elevation:4,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Row(
                        children: [
                          Text("Name: "),
                          SizedBox(width: 100,),
                          Text("Status"),
                        ],
                      ),
                      const Text("Gender"),
                      Text("${listOfStatus[0]!="null"?listOfStatus[0]:"nothing to show"}: ${listOfKeys[0]!="null"?listOfKeys[0]:"nothing to show"}"),
                      Text("${listOfStatus.length<=1?"nothing to show":listOfStatus[1]}: ${listOfStatus.length<=1?"nothing to show":listOfKeys[1]}"),

                      // Text("${snapshot.child('Status').value.toString()}"),
                      // Text("${listOfStatus[index]}: ${listOfKeys[index]}"),
                      //
                      // Text("Checked In:  ${listOfCheckedInDates[1]}"),
                      // Text("Checked Out: ${listOfCheckedOutDates[0]!="null"?listOfCheckedOutDates[0]:"nothing to show"}"),

                    ],),
                    // child: Text(snapshot.value.toString()),
                )),
                 );

            });
          }
          else if (state is GetAttendanceLoadingState){
            return const Align(alignment:Alignment.center,child: SizedBox(height:100,width:200,child: CircularProgressIndicator()));
          }
          else{
            return const Center(child: Text("failed"),);
          }
        },
      ))
    ],);
  }

  ListView buildListView() {
    return ListView.builder(itemCount: listOfDates.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            onTap: () => Navigator.pushNamed(context, allDataScreenRoute),
            leading: Card(
              child: Text(listOfDates[index].toString()),
            ),
          );
        });
  }
}
