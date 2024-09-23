import 'package:flutter/material.dart';
import '../constante.dart';

class MyProfil extends StatefulWidget {

  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          //avatar
          CircleAvatar(
            radius : 120,
            backgroundImage : NetworkImage(me.avatar!),

          ),


          //mail
          Text("${me.mail}"),


          //prenom
          Text("${me.prenom}"),


          //nom
          Text("${me.nom}"),
        ]
    );
  }


}