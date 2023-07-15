import 'package:androidapprelease/core/config/router.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, allBranchesRoute),
              child: const Text(
                'Show all Branches',
                style: TextStyle(fontSize: 24),
              )),
        ],
      ),
    );
  }
}
