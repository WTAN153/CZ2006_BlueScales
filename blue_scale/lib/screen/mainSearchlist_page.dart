import 'dart:math';

import 'package:blue_scale/screen/NOTUSE.dart';
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:blue_scale/screen/view/cardlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'filter_page.dart';

// do a info page of the card that link to grant page
class mainSearchlist_page extends StatefulWidget {
  @override
  _mainSearchlist_pageState createState() => _mainSearchlist_pageState();
}

class _mainSearchlist_pageState extends State<mainSearchlist_page> {
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFF3E0);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  List myList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  Map mapResponse,mapResponse1;
  List listOfFacts,listOfFacts1;
  String _search;
  String queryResultSet ;

  Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&limit=80000&sort=month%20desc'));


    if (response.statusCode == 200) {
      setState(() {


        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['result']['records'];
        for (int i = _currentMax; i < _currentMax + 10; i++) {
          myList.add(listOfFacts[i]);
        }

        _currentMax = _currentMax + 10;

        setState(() {});
      });
    }
  }





  @override
  void initState() {
    super.initState();
    myList = List.generate(0, (i) => "${i} ");
    if (myList.length==0) {
      fetchData();
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }



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

          actions: <Widget>[
            /*Container(
              width: 250,

              child:
              TextField(
                style: TextStyle(
                    color: Colors.black, height: 0, fontSize: 20),
                decoration: InputDecoration(
                    labelText: 'Town Search',
                    hintText: 'Enter Town',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    filled: true,
                    fillColor: Colors.grey[50]),
                onChanged: (value) {
                  _search = value
                      .trim();
                },
              ),
            )*/
            /* IconButton(
              alignment: Alignment.center,
              icon: new Icon(Icons.search, size: 35),
              color: Colors.black,
              onPressed:  ()async  {

                Navigator.push(context,MaterialPageRoute(builder: (context) => searchfilterPage(_search)));

              },
            ),*/
            IconButton(
              alignment: Alignment.center,
              icon: new Icon(Icons.search, size: 35),
              color: Colors.black,
              onPressed:  ()async  {

                //go to filter page WIP
                Navigator.push(context,MaterialPageRoute(builder: (context) => filter_screen()));

              },
            ),



            new IconButton(

              alignment: Alignment.center,
              icon: new Icon(Icons.account_circle,size:35),
              color:Colors.black,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => userprofile_page()));
              },
            ),
          ]
      ),


            body:ListView.builder(
                //shrinkWrap: true,
                controller: _scrollController,
               // physics: NeverScrollableScrollPhysics(),

                //itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                itemBuilder: (context, i) {
                  if (i == myList.length) {
                    return CupertinoActivityIndicator();
                  }

                  return cardTile((myList[i]));
                },
              itemCount:myList.length==null?0: myList.length + 1,
            ),
    );




  }
}

