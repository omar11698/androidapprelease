import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_entity.dart';
import '../blocs/get_users_bloc/get_users_bloc.dart';

List<User> listOfUsers = [
  User(id: 1, name: 'omar'),
  User(id: 2, name: 'ahmed'),
  User(id: 3, name: 'hassan'),
];

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Expanded(child: BlocBuilder<GetUsersBloc, GetUsersState>(
          builder: (context, state) {
            if (state is GetUsersSuccess) {
              return buildFirebaseAnimatedList(state);
            } else if (state is GetUsersLoading) {
              return buildProgressIndicator();
            } else {
              return const Center(
                child: Text("failed"),
              );
            }
          },
        ))
      ],
    );
  }

  Align buildProgressIndicator() {
    return Align(
        alignment: Alignment.center,
        child: Container(
            height: 100, width: 200, child: const CircularProgressIndicator()));
  }

  FirebaseAnimatedList buildFirebaseAnimatedList(GetUsersSuccess state) {
    return FirebaseAnimatedList(
        query: state.getDataReference,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, snapshot, animation, index) {
          var responseMap = snapshot.value;
          var userName=snapshot.child("Name").value.toString();
          var lastPaid=snapshot.child("LastPayedFee").value.toString();
          print(responseMap);

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: buildCard(name: userName,lastPaid: lastPaid!="null"?lastPaid :"doesn\'t have last payed fee  ",),
          );
        });
  }

  // ListView buildListView() {
  //   return ListView.builder(itemCount:listOfUsers.length ,itemBuilder: (BuildContext context, index){
  //     return ListTile(
  //       leading: Card(child: Text(listOfUsers[index].toString()),),
  //     );
  //   });
  // }
  Widget? buildCard({required String name, required String? lastPaid,}) {
    return Card(
      elevation: 4,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              Text(lastPaid!,style:const TextStyle(fontSize: 16),),
            ],
          ),
        ),

    );
  }
}

