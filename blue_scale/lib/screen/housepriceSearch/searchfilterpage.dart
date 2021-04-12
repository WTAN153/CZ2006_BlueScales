
import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:blue_scale/screen/view/cardlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class searchfilterPage extends StatefulWidget {
  final String blk,street,room,storey;
  searchfilterPage(this.blk,this.street,this.room,this.storey);
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
  List myList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 2;



  //https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"ANG%20MO%20KIO"}
 // https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"BEDOK","flat_type":"4%20ROOM"}&limit=100&sort=month%20desc
  //filters={"block":"253","street_name":"YISHUN%20RING%20RD","flat_type":"4%20ROOM","storey_range":"07%20TO%2009"}
  //data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"block":"253","street_name":"YISHUN RING RD","flat_type":"4 ROOM","storey_range":"07 TO 09"}&limit=100&sort=month%20desc
  Future fetchData(i1,i2,i3,i4) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"block":"'+i1+'","street_name":"'+i2+'","flat_type":"'+i3+' ROOM","storey_range":"'+i4+'"}&limit=100&sort=month%20desc'));
    // work but need to do something on the input
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['result']['records'];
        print(listOfFacts);
        for (int i = 0; i < listOfFacts.length ; i++) {
          myList.add(listOfFacts[i]);
        }

        //_currentMax = _currentMax + 2;

        setState(() {});
      });
    }
  }

  @override

  void initState() {
    String blki,streeti,roomi,storeyi ;
    blki = widget.blk;
    streeti=widget.street;
    roomi=widget.room;
    storeyi=widget.storey;


    //print(streeti);
    //print(roomi);
    super.initState();


    myList = List.generate(0, (i) => "${i} ");
    if (myList.length==0) {
      fetchData(blki,streeti,roomi,storeyi);
    }
   /* _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData(blki,streeti,roomi,storeyi);
      }
    });*/

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


            body: ListView.builder(
                //shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //controller: _scrollController,

                //itemCount: listOfFacts == null ? 0 : listOfFacts.length,
              itemBuilder: (context, i) {
                if ( myList.length==0) {
                  print("no search result");
                  return Center(
                    child: Text("No search result ", style: TextStyle(
                        color: Colors.black, fontSize: 20),),
                  );
                }
                else if ( myList.length>i){
                return cardTile((myList[i]));}
              },
              itemCount:myList.length==null?0: myList.length + 1,
            ),


    );
  }
}

