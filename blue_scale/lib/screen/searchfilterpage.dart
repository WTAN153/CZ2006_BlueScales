
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:blue_scale/screen/view/cardlistview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class searchfilterPage extends StatefulWidget {
  final String searchkey;
  searchfilterPage(this.searchkey);
  @override
  _searchfilterPageState createState() => _searchfilterPageState();
}

class _searchfilterPageState extends State<searchfilterPage> {
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFF3E0);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  Map mapResponse;
  List listOfFacts;
  String _search;






  //https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"ANG%20MO%20KIO"}

  Future fetchData(queryResultSet) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"'+queryResultSet+'"}&limit=100&sort=month%20desc'));
    if (response.statusCode == 200) {
      setState(() {

        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['result']['records'];
      });
    }
  }

  @override

  void initState() {
    String queryResultSet ;
    queryResultSet = widget.searchkey;
    fetchData(queryResultSet);
    super.initState();

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

