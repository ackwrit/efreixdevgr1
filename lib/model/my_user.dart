import 'package:cloud_firestore/cloud_firestore.dart';
class MyUser{
  late String mail;
  late String id;
  String? prenom;
  String? nom;
  String? avatar;



  MyUser.empty(){
    id = "";
    mail = "";
    prenom = "";
    nom = "";
    avatar = "https://firebasestorage.googleapis.com/v0/b/efreixdevgrp1.appspot.com/o/76370.jpg?alt=media&token=c00cbcc6-238c-47ab-b063-17d413bd25ff";
  }


  MyUser(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    mail = map["EMAIL"] ?? "";
    prenom = map["PRENOM"] ?? "";
    nom = map["NOM"] ?? "";
    avatar = map["AVATAR"] ?? "https://firebasestorage.googleapis.com/v0/b/efreixdevgrp1.appspot.com/o/76370.jpg?alt=media&token=c00cbcc6-238c-47ab-b063-17d413bd25ff";
  }
}