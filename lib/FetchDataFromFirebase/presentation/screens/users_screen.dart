import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';
List<User> listOfUsers=[User(id: 1, name: 'omar'),User(id: 2, name: 'ahmed'),User(id: 3, name: 'hassan'),];
class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView.builder(itemCount:listOfUsers.length ,itemBuilder: (BuildContext context, index){
        return ListTile(
          leading: Card(child: Text(listOfUsers[index].toString()),),
        );
      }),
    );
  }
}
