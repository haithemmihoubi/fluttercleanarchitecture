import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Screen"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("New Screen"),
      ),
    );
  }
}
