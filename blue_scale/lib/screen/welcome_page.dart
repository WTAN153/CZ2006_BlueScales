
import 'package:blue_scale/screen/rentsearch_page.dart';
import 'package:blue_scale/screen/mainSearchlist_page.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget{
  final Color primaryColor = Color(0xff18203d);
  final Color Orange = Color(0xffffab40);


  @override
  Widget build(BuildContext content) {
    return Scaffold(
        appBar: null,

      backgroundColor: primaryColor,
        extendBodyBehindAppBar: true,
      body: Container(

          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcomescreen.jpg'),

                  fit: BoxFit.cover)
          ),


          alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              SizedBox(height: 90),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orangeAccent,fontSize: 60,fontWeight: FontWeight.bold)
                

                ),
            SizedBox(height: 80,),
                MaterialButton(
                  elevation: 0,
                  minWidth: 200,
                  height: 80,
                  onPressed: ()  {
                    Navigator.push(content,MaterialPageRoute(builder: (context) => RentsearchScreen()));
                  },

                  color: Orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Rent',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 40,),
                MaterialButton(
                  elevation: 0,
                  minWidth: 200,
                  height: 80,
                  onPressed: ()   {
                    Navigator.push(content,MaterialPageRoute(builder: (context) => mainSearchlist_page()));  // go to house price page// change context to content
                  },

                  color: Orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text('House Price',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  textColor: Colors.white,
                ),







          ]
      )
      )
      )
    );

  }
}