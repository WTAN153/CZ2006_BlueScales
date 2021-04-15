// import 'package:blue_scale/screen/userprofile_page.dart';
// import 'package:flutter/material.dart';

// import 'package:sklite/SVM/SVM.dart';
// import 'package:sklite/utils/io.dart';
// import 'dart:convert';

// // not use with ML code

// class selectedSearchScreen extends StatefulWidget {
//   var flatdata;
//   selectedSearchScreen(this.flatdata);
//   @override
//   _selectedSearchScreenState createState() => _selectedSearchScreenState();
// }

// class _selectedSearchScreenState extends State<selectedSearchScreen> {
//   final Color primaryColor = Color(0xff18203d);

//   final Color secondaryColor = Color(0xff232c51);

//   final Color themeColor = Color(0xFFFFF3E0);

//   final Color Orange = Color(0xffffab40);

//   final TextEditingController nameController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   SVC svc;  // test out the ai machine learning model
//   var test=[146.0];  // test input
//   var y;
//   _selectedSearchScreenState() {
//     loadModel('assets/svciris.json').then((x) {
//       this.svc = SVC.fromMap(json.decode(x));
//       y=svc.predict(test);
//       print(y);               // predicted result pass throught the model
//       print('here');
//       //image: AssetImage('assets/welcomescreen.jpg'),
//     });
//   }
//   String _email ,_password,_cpassword;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: themeColor,
//             elevation: 0,
//             leading: new IconButton(
//               icon: new Icon(Icons.arrow_back),
//               color:Colors.black,
//               onPressed: () {
//                 Navigator.of(context).maybePop();
//               },
//             ),

//             actions: <Widget>[new IconButton(

//               alignment: Alignment.center,
//               icon: new Icon(Icons.account_circle,size:35),
//               color:Colors.black,
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder: (context) => userprofile_page()));
//               },
//             ),
//             ]
//         ),
//         backgroundColor: Colors.white,
//         extendBodyBehindAppBar: false,
//         body:Center(
//             child:Container(
//                 child: Column(
//                     children: <Widget>[
//                   Text(widget.flatdata['town'].toString()+' '+widget.flatdata['block'],style: TextStyle(color: Colors.black)),
//                   Text(widget.flatdata['flat_type'].toString()+' Room', style: TextStyle(color: Colors.black)),

//                   ]

//                 )

//             )
//         )
//     );
//   }
// }
