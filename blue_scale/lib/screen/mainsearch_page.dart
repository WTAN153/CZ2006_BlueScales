
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:flutter/material.dart';




//not use

class MainsearchScreen extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color themeColor = Color(0xFFFFF3E0);

  final Color Orange = Color(0xffffab40);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  String _email ,_password,_cpassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color:Colors.black,
            onPressed: () {
            Navigator.of(context).maybePop();
            },
          ),

          actions: <Widget>[new IconButton(

            alignment: Alignment.center,
            icon: new Icon(Icons.account_circle,size:35),
            color:Colors.black,
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => userprofile_page()));
            },
          ),
            ]
        ),
        backgroundColor: primaryColor,
        extendBodyBehindAppBar: true,
        body:Center(
            child:Container(
              child: Column(
                








              )

            )
        )
    );
  }




}