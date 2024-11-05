import 'package:flutter/material.dart';
import '../constante.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class MyProfil extends StatefulWidget {

  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  //variable
  String? namePhotos;
  Uint8List? bytesPhotos;


  //methode
  choicePhotos(){
    showDialog(
      barrierDismissible: false,
        context: context, 
        builder: (context){
          return AlertDialog.adaptive(
            title: Text("Souhaitez enregistrez l'image ?"),
            content: Image.memory(bytesPhotos!),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Annuler")
              ),
              
              TextButton(
                  onPressed: (){
                    //uploader l'image 
                  }, 
                  child: Text("Enregister")
              )
            ],
          );
        }
    );
  }
  
  
  checkPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
    );
    if(result != null){
      namePhotos = result.files.first.name;
      bytesPhotos = result.files.first.bytes;
      choicePhotos();
      
    }


  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          //avatar
          GestureDetector(
            onTap:checkPhoto,
            child: CircleAvatar(
              radius : 80,
              backgroundImage : NetworkImage(me.avatar!),

            ),
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