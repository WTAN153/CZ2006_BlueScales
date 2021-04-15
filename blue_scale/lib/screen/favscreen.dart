import 'dart:math';


import 'package:blue_scale/controller/login_controller.dart';
import 'package:blue_scale/entity/DataAccess.dart';
import 'package:blue_scale/entity/favdata.dart';

import 'package:blue_scale/screen/userprofile_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




// do a info page of the card that link to grant page
class favscreen_page extends StatefulWidget {
  @override
  _favscreen_pageState createState() => _favscreen_pageState();
}

class _favscreen_pageState extends State<favscreen_page> {
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
    final user = LoginController().getCurrentUID();
    //print(queryResultSet);

    return StreamBuilder<favdata>(
      stream: DataAccess(uid: user).userfData,
    builder: (context, snapshot) {
        if (snapshot.hasData) {
          favdata favData = snapshot.data; //userData now have all the access of the userdata
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
            /*body: Text("Email: ${favData.fprice}",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black)),*/


              /* body:ListView.builder(
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
              ),*/
          body:  Card(
              margin: EdgeInsets.all(5),
                  elevation: 4,
                  color: Colors.grey[200],
                  child: InkWell( // on chick function
                  onTap: () {

                    //Navigator.push(context,MaterialPageRoute(builder: (context) => selectedSearchScreen(widget.ifdata)));
                  },
                    child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: Row(
                    children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              favData.faddress.toString()+' '+favData.fblk,
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          color: Colors.black
                          ),
                          ),
                              SizedBox(height: 4),
                              Text(favData.fprice.toString(), style: TextStyle(color: Colors.black)),
                              Text(favData.fstorey.toString()+' storey', style: TextStyle(color: Colors.black)),
                              Text('Area(Sqm): '+favData.fprice.toString(), style: TextStyle(color: Colors.black)),
                              Text(favData.fprice.toString(), style: TextStyle(color: Colors.black)),
                              Text('Remaining Lease: '+favData.fprice.toString(), style: TextStyle(color: Colors.black)),

                  ],
                      ),
                      Spacer(),
                      Text(favData.fprice.toString(), style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),),
                      //Text("/month",style: TextStyle(color: Colors.black))
                      ],
                      ),
                      ),
                      )
                      )








            );
            }

            else {
            return Container(width: 0.0, height: 0.0);

            }

            }
            );
        }}
