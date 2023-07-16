import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_entity.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';
List<User> listOfUsers=[User(id: 1, name: 'omar'),User(id: 2, name: 'ahmed'),User(id: 3, name: 'hassan'),];
class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(

        children: [
          const SizedBox(height: 40,),

          Expanded(child: BlocBuilder<GetUsersBloc, GetUsersState>(
          builder: (context, state) {
            if(state is GetUsersSuccess){

              return FirebaseAnimatedList(query:state.getDataReference , itemBuilder: (context,snapshot,animation,index){

                return ListTile(
                  // leading: Text(state.getDataReference.child("26-12-2023").child("08:45").onValue.toString()),
                  leading: Card(elevation:4,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.value.toString()),
                  )),
                );
              });
            }
            else if (state is GetUsersLoading){
              return Align(alignment:Alignment.center,child: Container(height:100,width:200,child: const CircularProgressIndicator()));
            }
            else{
              return const Center(child: Text("failed"),);
            }
          },
        ))
      ],),
    );
  }

  // ListView buildListView() {
  //   return ListView.builder(itemCount:listOfUsers.length ,itemBuilder: (BuildContext context, index){
  //     return ListTile(
  //       leading: Card(child: Text(listOfUsers[index].toString()),),
  //     );
  //   });
  // }
}
