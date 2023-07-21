import 'dart:convert';

import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:androidapprelease/core/config/router.dart';
import 'package:dartz/dartz_unsafe.dart';
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
      Expanded(child: BlocBuilder<GetUsersBloc,GetUsersState>(
      builder: (context, state) {
        if(state is GetUsersSuccess)  {
          Future<List<Map<dynamic, dynamic>>>users= _getUsers(state);
          print("WE ARE USERS $users");
          late final List<Map<dynamic, dynamic>> outerUsersList ;
          users.then((value) {
              List<Map<dynamic, dynamic>> usersList =[];
            value.forEach((element) {
              usersList.add(element);
              print(element.runtimeType);

            });
            print(usersList);
            outerUsersList=usersList;
            return usersList;
          });


          return _buildGetAttendanceBlocBuilder();
        }

        else if (state is GetUsersLoading){
          return const Align(alignment:Alignment.center,child: SizedBox(height:100,width:100,child: CircularProgressIndicator()));
        }
        else{
          return const Center(child: Text("failed"),);
        }
      },
))
    ],);
  }

  BlocBuilder<GetAttendanceBloc, GetAttendanceState> _buildGetAttendanceBlocBuilder() {
    return BlocBuilder<GetAttendanceBloc, GetAttendanceState>(
          builder: (context, state) {

            if(state is GetAttendanceSuccess){
              return _buildGetAttendaceFirebaseAnimatedList(state);
            }

            else if (state is GetAttendanceLoadingState){
              return const Align(alignment:Alignment.center,child: SizedBox(height:100,width:200,child: CircularProgressIndicator()));
            }

            else{
              return const Center(child: Text("failed"),);
            }
          },
        );
  }

  FirebaseAnimatedList _buildGetAttendaceFirebaseAnimatedList(GetAttendanceSuccess state) {
    return FirebaseAnimatedList(query:state.databaseReference , itemBuilder: (context,snapshot,animation,index){
            List<String> listOfStatus=[];
            List<String> listOfKeys=[];
            List<AttendanceTime> listOfMaps=[];

            for (var element in snapshot.children) {
              for (var element in element.children) {
                String status=element.child("Status").value.toString();
                String key=element.key.toString();
                listOfStatus.add(status);
                listOfKeys.add(key);
                listOfMaps.add(AttendanceTime(time: key,attendanceStatus: status));
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
                        Expanded(child: SizedBox(width: double.infinity,)),
                        Align(alignment:Alignment.centerRight,child: Text("Status")),
                      ],
                    ),
                    const Text("Gender"),
                    Text("${listOfStatus[0]!="null"?listOfStatus[0]:"nothing to show"}: ${listOfKeys[0]!="null"?listOfKeys[0]:"nothing to show"}"),
                    Text("${listOfStatus.length<=1?"nothing to show":listOfStatus[1]}: ${listOfStatus.length<=1?"nothing to show":listOfKeys[1]}"),
                    // Text("${listOfStatus.length<=1?"nothing to show":listOfStatus[1]}: ${listOfStatus.length<=1?"nothing to show":listOfKeys[1]}"),

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

  Future<List<Map<dynamic, dynamic>>> _getUsers(GetUsersSuccess state) async {
    List<Map<dynamic,dynamic>>users=[];
    return  await state.getDataReference.get().then((value) {
      final usersBranchResult=value.value as List;
      usersBranchResult.forEach((element) {
        if(element !=null){
          users.add(element as Map );

        }
        print(element.runtimeType);
      });

      return users;

    });
  }
}
