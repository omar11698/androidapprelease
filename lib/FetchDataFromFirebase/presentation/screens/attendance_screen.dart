import 'package:androidapprelease/core/config/router.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/get_attendance_bloc/get_attendance_bloc.dart';

List<DateTime> listOfDates = [DateTime.now(), DateTime.now()];

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Expanded(child: BlocBuilder<GetAttendanceBloc, GetAttendanceState>(
          builder: (context, state) {
            if(state is GetAttendanceSuccess){
              return FirebaseAnimatedList(query:state.databaseReference , itemBuilder: (context,snapshot,animation,index){

                return ListTile(
                  // leading: Text(state.databaseReference.child("26-12-2023").child("08:45").onValue.toString()),
                  leading: Card(elevation:4,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.value.toString()),
                  )),
                );
              });
            }
            else if (state is GetAttendanceLoadingState){
              return Align(alignment:Alignment.center,child: Container(height:100,width:200,child: const CircularProgressIndicator()));
            }
            else{
              return Center(child: Text("failed"),);
            }
          },
        ))
      ],),
    );
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
