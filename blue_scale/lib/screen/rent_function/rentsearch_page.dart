import 'package:blue_scale/controller/login_controller.dart';

import 'package:blue_scale/entity/DataAccess.dart';
import 'package:blue_scale/entity/Rent.dart';
import 'package:blue_scale/screen/rent_function/rentposting_page.dart';
import 'package:blue_scale/screen/view/rentlistsearch.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// search bar from card list

class RentsearchScreen extends StatefulWidget {
  @override
  _RentsearchScreenState createState() => _RentsearchScreenState();
}

class _RentsearchScreenState extends State<RentsearchScreen> {
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFEEE8);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String _search;

  String queryResultSet;

  //var tempSearchStore = [];

  initiateSearch(svalue) {
    setState(() {
      queryResultSet = svalue;
      //tempSearchStore = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = LoginController().getCurrentUID();
    print(queryResultSet);

    return StreamProvider<List<Rentdata>>.value(
      value: DataAccess().rentDatas,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: themeColor,
            elevation: 0,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).maybePop();
              },
            ),
            actions: <Widget>[
              Container(
                width: 250,
                child: TextField(
                  style:
                      TextStyle(color: Colors.black, height: 0, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.grey[50]),
                  onChanged: (value) {
                    _search = value.trim();
                  },
                ),
              ),
              IconButton(
                alignment: Alignment.center,
                icon: new Icon(Icons.search, size: 35),
                color: Colors.black,
                onPressed: () async {
                  //showSearch(context: context, delegate: DataSearch());
                  initiateSearch(_search);
                },
              ),
              IconButton(
                alignment: Alignment.center,
                icon: new Icon(Icons.account_circle, size: 35),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => userprofile_page()));
                },
              ),
            ]),
        backgroundColor: themeColor,
        extendBodyBehindAppBar: true,
        body: RentListsearch(queryResultSet),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RichText(
                    text: TextSpan(
                        text: 'Want to put your house for rent? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                      TextSpan(
                        text: 'here',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => rentpost_screen()));
                          },
                      )
                    ])),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
