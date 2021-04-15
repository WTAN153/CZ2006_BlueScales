

import 'package:blue_scale/controller/login_controller.dart';
import 'package:blue_scale/controller/user_controller.dart';
import 'package:blue_scale/entity/DataAccess.dart';
import 'package:blue_scale/entity/favdata.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../housepriceSearch/selectedSearchScreen.dart';
import '../userprofile_page.dart';



class cardTile extends StatefulWidget {


  //final String searching;
  var ifdata;
  cardTile( this.ifdata);

  @override
  _cardTileState createState() => _cardTileState();
}







class _cardTileState extends State<cardTile> {
/*  final user = LoginController().getCurrentUID();
  @override
  void initState() {
    super.initState();
    StreamBuilder<favdata>(
        stream: DataAccess(uid: user).userfData,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      favdata favData = snapshot
          .data; //userData now have all the access of the userdata
        return widget.favData.fstorey;
    }}
    );
  }}*/

  IconData _iconshape= Icons.favorite_border;
  final user = LoginController().getCurrentUID();
  bool favb =false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<favdata>(
        stream: DataAccess(uid: user).userfData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            favdata favData = snapshot
                .data; //userData now have all the access of the userdata
            return Card(
                margin: EdgeInsets.all(5),
                elevation: 4,
                color: Colors.grey[200],
                child: InkWell( // on chick function
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            selectedSearchScreen(widget.ifdata)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              widget.ifdata['town'].toString() + ' ' +
                                  widget.ifdata['block'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(widget.ifdata['flat_type'].toString(),
                                style: TextStyle(color: Colors.black)),
                            Text(widget.ifdata['storey_range'].toString() +
                                ' storey', style: TextStyle(color: Colors
                                .black)),
                            Text('Area(Sqm): ' + widget.ifdata['floor_area_sqm']
                                .toString(), style: TextStyle(color: Colors
                                .black)),
                            Text(widget.ifdata['flat_model'].toString(),
                                style: TextStyle(color: Colors.black)),
                            Text('Remaining Lease: ' + widget
                                .ifdata['remaining_lease'].toString(),
                                style: TextStyle(color: Colors.black)),
                             IconButton(
                              icon: Icon(_iconshape),
                              onPressed: () async {

                                if(favb==true){


                                 setState(() {
                                   favb=false;
                                   _iconshape = Icons.favorite_border;
                                 });
                                }
                                else {
                                  await UserController.storefav(
                                      widget.ifdata['block'],
                                      widget.ifdata['town'],
                                      widget.ifdata['storey_range'],
                                      widget.ifdata['resale_price']
                                  );
                                  setState(() {

                                    favb = true;
                                    _iconshape = Icons.favorite;
                                  });
                                }
                              },
                            )


                          ],
                        ),
                        Spacer(),
                        Text(widget.ifdata['resale_price'].toString(),
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),),
                        //Text("/month",style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                )
            );
          }
          else {
            return Container();
          }
        }
    );
  }

}
