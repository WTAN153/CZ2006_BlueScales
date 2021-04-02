

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../userprofile_page.dart';



class cardTile extends StatelessWidget {


  //final String searching;
  var ifdata;
  cardTile( this.ifdata);



  @override
  Widget build(BuildContext context) {
    String searchS;
    //searchS = searching;

    if (true ){
      return Card(
        margin: EdgeInsets.all(5),
        elevation: 4,
        color: Colors.grey[200],
          child: InkWell( // on chick function
          onTap: () {
           //go to the hdb detail page for further grant calculation
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
                    ifdata['town'].toString()+' '+ifdata['block'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                  SizedBox(height: 4),
                  Text(ifdata['flat_type'].toString()+' Room', style: TextStyle(color: Colors.black)),
                  Text(ifdata['storey_range'].toString()+' storey', style: TextStyle(color: Colors.black)),
                  Text('Area(Sqm): '+ifdata['floor_area_sqm'].toString(), style: TextStyle(color: Colors.black)),
                  Text(ifdata['flat_model'].toString(), style: TextStyle(color: Colors.black)),
                  Text('Remaining Lease: '+ifdata['remaining_lease'].toString(), style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Text(ifdata['resale_price'].toString(), style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),),
              //Text("/month",style: TextStyle(color: Colors.black))
            ],
          ),
          ),
          )
      );



    }
    else {return Container();}
    }
    //else {return Container();} // if there is no posting by the user there will not be any info, prevent from throwing error

}
