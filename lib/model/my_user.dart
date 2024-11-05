import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xdevefreigr1/constante.dart';

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
    avatar = imageDefault;
  }


  MyUser(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    mail = map["EMAIL"] ?? "";
    prenom = map["PRENOM"] ?? "";
    nom = map["NOM"] ?? "";
    avatar = map["AVATAR"] ?? imageDefault;
  }
}