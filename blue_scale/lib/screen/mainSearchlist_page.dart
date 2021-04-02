import 'dart:math';

import 'package:blue_scale/screen/searchfilterpage.dart';
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:blue_scale/screen/view/cardlistview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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


  Map mapResponse,mapResponse1;
  List listOfFacts,listOfFacts1;
  String _search;
  String queryResultSet ;










  //https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"ANG%20MO%20KIO"}

 Future fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&limit=500&sort=month%20desc'));


    if (response.statusCode == 200) {
      setState(() {


        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['result']['records'];
      });
    }
  }

  @override
  void initState() {

    super.initState();
    fetchData();

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
            Container(
              width: 250,

              child:
              TextField(
                style: TextStyle(
                    color: Colors.black, height: 0, fontSize: 20),
                decoration: InputDecoration(
                    labelText: 'Search',
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
            )
            , IconButton(
              alignment: Alignment.center,
              icon: new Icon(Icons.search, size: 35),
              color: Colors.black,
              onPressed:  ()async  {

                Navigator.push(context,MaterialPageRoute(builder: (context) => searchfilterPage(_search)));

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
      body: mapResponse == null
          ? Container()
          : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /*Text(
              mapResponse['result']['records'].toString(),
              style: TextStyle(fontSize: 30,color: Colors.black),

            ),*/
          /*  ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      //Image.network(listOfFacts[index]['image_url']),
                      Text(
                        listOfFacts[index]['town'].toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Text(
                        listOfFacts[index]['flat_type'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                            color: Colors.blue
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: listOfFacts == null ? 0 : listOfFacts.length,
            ),*/

              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                  itemBuilder: (context, index) {

                    return cardTile((listOfFacts[index]));

                  }

              ),
          ],
        ),
      ),
    );
  }
}

