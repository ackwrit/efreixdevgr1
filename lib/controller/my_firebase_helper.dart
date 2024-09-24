import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';

import '../model/my_user.dart';
class MyFirebaseHelper{
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUtilisateur = FirebaseFirestore.instance.collection("UTILISATEURS");



  //inscription
  Future<MyUser>inscription(String email,String password) async{
    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email,password: password);
    String id = credential.user!.uid;
    Map<String,dynamic> datas = {
      "EMAIl":email,
    };
    addUser(id,datas);
    return getUser(id);

  }


  Future<MyUser>connexion(String email,String password) async{
    UserCredential credential = await auth.signInWithEmailAndPassword(email: email,password: password);
    String uid = credential.user!.uid;
    return getUser(uid);

  }

  //recuperer un UTILISATEURS
  Future <MyUser>getUser(uid) async{
    DocumentSnapshot snapshot = await cloudUtilisateur.doc(uid).get();
    return MyUser(snapshot);

  }


  //ajouter un UTILISATEURS
  addUser(String uid, Map<String,dynamic> data){
    cloudUtilisateur.doc(uid).set(data);
  }


  //mettre à jour un UTILISATEURS
  UpdateUser(String uid, Map<String,dynamic> data){
  cloudUtilisateur.doc(uid).update(data);
  }


//supprimer un UTILISATEURS


//uploader une Image
Future<String>updloadingPhoto(String nameImage, Uint8List bytesPhoto,String uid){
    String url;
    TaskSnapshot snapshot = await storage.ref("IMAGES/$uid/$nameImage").putData(bytesPhoto);
    url = await snapshot.ref.getDownloadURL();


    return url;

}


}