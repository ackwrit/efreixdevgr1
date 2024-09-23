import 'package:flutter/material.dart';
import 'profil.dart';

class MyDashBoard extends StatefulWidget {
  String message;
  MyDashBoard({super.key ,required this.message});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height,
        color: Colors.purple,
        child: MyProfil(),
      ),
      appBar: AppBar(
        title: Text("Ma nouvelle page"),
      ),
      body: Text("Je me suis connecté avec cette adresse ${widget.message}"),

    );
  }


}