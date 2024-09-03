import 'package:flutter/material.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Package Screen",style: TextStyle(fontSize: 15),),
      ),
    );
  }
}
