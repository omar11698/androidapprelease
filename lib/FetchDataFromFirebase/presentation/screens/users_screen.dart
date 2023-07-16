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
      body:Column(children: [
        Expanded(child: BlocBuilder<GetUsersBloc, GetUsersState>(
          builder: (context, state) {
            if(state is GetUsersSuccess){
              return FirebaseAnimatedList(query:state.getDataReference , itemBuilder: (context,snapshot,animation,index){

                return ListTile(
                  leading: Text(state.getDataReference.child("26-12-2023").child("08:45").onValue.toString()),
                );
              });
            }
            else if (state is GetUsersLoading){
              return CircularProgressIndicator();
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
    return ListView.builder(itemCount:listOfUsers.length ,itemBuilder: (BuildContext context, index){
      return ListTile(
        leading: Card(child: Text(listOfUsers[index].toString()),),
      );
    });
  }
}
