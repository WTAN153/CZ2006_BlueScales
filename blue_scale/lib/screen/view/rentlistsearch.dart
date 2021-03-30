
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:blue_scale/entity/Rent.dart';

class RentListsearch extends StatefulWidget {
  final String searched;
  RentListsearch(this.searched);
  @override
  _RentListsearchState createState() => _RentListsearchState();
}

class _RentListsearchState extends State<RentListsearch> {
  @override

  Widget build(BuildContext context) {
    String searchval;
    searchval= widget.searched;

    final rents = Provider.of<List<Rentdata>>(context)??[];


    return ListView.builder(

        itemCount: rents.length,
        itemBuilder: (context, index) {
          return RentTile(( rents[index]), searchval);
        }

    );
  }
}

class RentTile extends StatelessWidget {

  final Rentdata rent;
  final String searching;
  RentTile( this.rent ,this.searching);



  @override
  Widget build(BuildContext context) {
    String searchS;
    searchS = searching;

    if (rent.blk!=null&& rent.address==searching ){
      return Card(
        margin: EdgeInsets.all(12),
        elevation: 4,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('${rent.blk} ${rent.address}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black)),
                  SizedBox(height: 4),
                  Text("${rent.storey} Storey", style: TextStyle(color: Colors.black)),
                  Text("Phone no. ${rent.phone}", style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Text(rent.price, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),),
              Text("/month",style: TextStyle(color: Colors.black))
            ],
          ),
        ),
      );



    }
    else if(rent.blk!=null&& searching=='' ){
      return Card(
        margin: EdgeInsets.all(12),
        elevation: 4,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('${rent.blk} ${rent.address}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black)),
                  SizedBox(height: 4),
                  Text("${rent.storey} Storey", style: TextStyle(color: Colors.black)),
                  Text("Phone no. ${rent.phone}", style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Text(rent.price, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),),
              Text("/month",style: TextStyle(color: Colors.black))
            ],
          ),
        ),
      );

    }else {
      if (rent.blk!=null && (searching=='' || searching==null) ) {
        return Card(
          margin: EdgeInsets.all(12),
          elevation: 4,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('${rent.blk} ${rent.address}', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                    SizedBox(height: 4),
                    Text("${rent.storey} Storey",
                        style: TextStyle(color: Colors.black)),
                    Text("Phone no. ${rent.phone}",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                Spacer(),
                Text(rent.price, style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text("/month", style: TextStyle(color: Colors.black))
              ],
            ),
          ),
        );
      }else {return Container();}
  }
    //else {return Container();} // if there is no posting by the user there will not be any info, prevent from throwing error

  }
}