import 'package:androidapprelease/core/constants/strings.dart';
import 'package:flutter/material.dart';

class  BranchesGridScreen extends StatelessWidget {

  const BranchesGridScreen ({super.key});


  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      kStrImages,
      kStrImages,
      kStrImages,
      kStrImages,
      kStrImages,
      kStrImages,
      kStrImages,
      kStrImages,
    ];
    return  Scaffold(

      body: _buildBody(context,items),
    );
  }

  _buildBody(BuildContext context, List<String> items) {
    return GridView.builder(
       itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 0.0, // Spacing between columns
      mainAxisSpacing: 0.0, // Spacing between rows
    ), itemBuilder:(BuildContext context, int index) {
    return Container(
    decoration: boxDecoration(),
    child: Center(
    child: itemCard(items, index),
    ),
    );}
    );
  }

  Container itemCard(List<String> items, int index) {
    return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        buildImage(items, index),
        const SizedBox(height: 20,),
         buildLargeText(),
        const SizedBox(height: 10,),
         buildSmalltext(),

      ],
    ),
  );
  }

  Expanded buildImage(List<String> items, int index) {
    return Expanded(
          child: Image.asset(
            items[index],
            // Adjust the image dimensions as needed
            width: 100.0,
            height: 100.0,
          ),
        );
  }

  Text buildLargeText() {
    return const Text(
          "Interesting",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        );
  }

  Text buildSmalltext() {
    return Text(
          "Interesting",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
  }

  BoxDecoration boxDecoration() => BoxDecoration(border:Border.all(color: Colors.grey),color: Colors.transparent,);
}
