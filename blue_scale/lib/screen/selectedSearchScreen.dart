import 'dart:async';

import 'package:blue_scale/screen/userprofile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;





class selectedSearchScreen extends StatefulWidget {
  var flatdata;
  selectedSearchScreen(this.flatdata);
  @override
  _selectedSearchScreenState createState() => _selectedSearchScreenState();
}

class _selectedSearchScreenState extends State<selectedSearchScreen> {
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFF3E0);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Map mapResponse;
  List listOfFacts;

  List myList;

  var resaledata=[];



  Future <int> fetchData(vv1,vv2,vv3) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee&filters={"town":"'+vv1+'","flat_type":"'+vv2+'","street_name":"'+vv3+'"}&limit=100&sort=month%20desc'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['result']['records'];
        //print(mapResponse['result']['total']);



        setState(() {});

      });
    }
  }

  @override

  Future<void> initState()  {
    String v1,v2,v3;
    v1=widget.flatdata['town'].toString();
    v2=widget.flatdata['flat_type'].toString();
    v3=widget.flatdata['street_name'].toString();

    // fetchData(queryResultSet);
    super.initState();
       Future<int> max=fetchData(v1,v2,v3);



  }


  @override
  Widget build(BuildContext context ) {


   int max;
    if (mapResponse['result']['total'] > 100) {
    max = 100;
    }
    else {
    max = mapResponse['result']['total'];
    }

      // List<double> intList = resaledata.map((s) => s as double).toList();
      for (int i = 0; i < max; i++) {
        var resaleprice = double.parse(listOfFacts[i]['resale_price']);
        resaledata.add(resaleprice);
      }
      List<double> intList = resaledata.map((s) => s as double).toList();
      intList.sort();
      double gap = intList[max - 1] - intList[0];
      //print(intList);

    return listOfFacts.length==null?
    Center(child: CircularProgressIndicator())
        :

    Scaffold(
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
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: false,
        body:Center(

            child:Container(
                child: Column(
                    children: <Widget>[

                      SizedBox(height: 20,),
                      Text('Price', style: TextStyle(color: Colors.black, fontSize: 20),),
                      Text(r"$"+widget.flatdata['resale_price'].toString(),style: TextStyle(color: Orange,fontSize: 50,fontWeight: FontWeight.bold)),
                      Text('Date: '+widget.flatdata['month'].toString(),style: TextStyle(color: Colors.black)),
                      SizedBox(height: 20,),
                      MaterialButton(
                        elevation: 0,
                        minWidth: 180,
                        height: 30,
                        onPressed: ()   {
                           // go to grant calculation
                        },

                        color: Orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Text('Grant calculation',
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text('Price range', style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),),
                      ),

                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text('Price difference: '+ gap.toString(), style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                        ),),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),

                        ),
                        height: 100,
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.all(1.0),

                          child: new Sparkline(



                            data: intList,
                            lineColor: Color(0xffff6101),
                            pointsMode: PointsMode.none,
                            pointSize: 8.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text('Graph show the price of the recent 100 flat sold around the area', style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.blueGrey,
                        ),),
                      ),




                      SizedBox(height: 30,),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child:Text('Address : Blk '+widget.flatdata['block'].toString()+' '+widget.flatdata['street_name'].toString(),style: TextStyle(color: Colors.black)),),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),//117
                        child:Text('Flat type : '+widget.flatdata['flat_type'].toString(), style: TextStyle(color: Colors.black)),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),//140
                        child:Text('Storey Range : '+widget.flatdata['storey_range'].toString(),style: TextStyle(color: Colors.black)),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),//155
                        child:Text('Floor area : '+widget.flatdata['floor_area_sqm'].toString(),style: TextStyle(color: Colors.black)),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),//145
                        child:Text('Flat model : '+widget.flatdata['flat_model'].toString(),style: TextStyle(color: Colors.black)),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),//95
                        child:Text('Remaining Lease : '+widget.flatdata['remaining_lease'].toString(),style: TextStyle(color: Colors.black)),),













                    ]







                )

            )
        )
    );
  }
}