import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:blue_scale/entity/user.dart';

//this function is like how to print out the data in the firestore
//currently not in use
class userdatabase extends StatefulWidget{
  @override
  userdatalistState createState()=> userdatalistState();

}

class userdatalistState extends State<userdatabase>{
  @override
  Widget build(BuildContext context){
    final info = Provider.of<List<Userdatabase>>(context);
    //print(info.docs);
    info.forEach((info) {
      print(info.email);

    });



    return Container(

    );
  }
}