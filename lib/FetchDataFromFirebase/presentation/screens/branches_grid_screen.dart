import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:androidapprelease/FetchDataFromFirebase/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:androidapprelease/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/branch_entity.dart';

class BranchesGridScreen extends StatelessWidget {

  const BranchesGridScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final List<Branch> items = [];
    return Scaffold(

      body: BlocBuilder<GetUsersBloc, GetUsersState>(
        builder: (context, state) {

          if(state is GetUsersSuccess){
            var branchName="";
            var query=state.getDataReference.parent?.parent;
            query?.onValue.listen((event) {
              print(event.snapshot.value.toString());
              // branchName=event.snapshot.value.toString();
            });
            var branchLogo="";
            items.add(Branch(name: "query", logo: kStrImages));
            return _buildBody(context, items);

          }
          else if (state is GetUsersLoading){
            return const Align(alignment:Alignment.center,child: SizedBox(height:100,width:100,child: CircularProgressIndicator()));
          }
          else {
            return const Text("Failed");
          }


          },
      ),
    );
  }

  _buildBody(BuildContext context, List<Branch> items) {
    return GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 0.0, // Spacing between columns
          mainAxisSpacing: 0.0, // Spacing between rows
        ), itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: boxDecoration(),
        child: Center(
          child: itemCard(items, index),
        ),
      );
    }
    );
  }

  Container itemCard(List<Branch> items, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _buildImage(items, index),
          const SizedBox(height: 20,),
          _buildLargeText(items,index),
          const SizedBox(height: 10,),
          _buildSmallText(items,index),

        ],
      ),
    );
  }

  Expanded _buildImage(List<Branch> items, int index) {
    return Expanded(
      child: Image.asset(
        items[index].logo,
        // Adjust the image dimensions as needed
        width: 100.0,
        height: 100.0,
      ),
    );
  }

  Text _buildLargeText(List<Branch> items, int index) {
    return  Text(
      items[index].name??"",
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  Text _buildSmallText(List<Branch> items, int index) {
    return  Text(
      items[index].name??"",
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }

  BoxDecoration boxDecoration() =>
      BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.transparent,);
}
