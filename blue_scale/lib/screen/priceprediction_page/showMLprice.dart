import 'dart:convert';
import 'dart:io';

import 'package:blue_scale/screen/priceprediction_page/priceprediction_page.dart';
import 'package:flutter/material.dart';

// class ShowMLPrice extends StatefulWidget {
//   final double predictedPrice;
//   ShowMLPrice({
//     Key key,
//     @required this.predictedPrice,
//   }) : super(key: key);
//   @override
//   ShowMLPricePage createState() => ShowMLPricePage();
// }

class ShowMLPricePage extends StatelessWidget {
  final double predictedPrice;

  String town, flattype, address;
  int storeyPremium, leasePremium, floorpersqm;
  ShowMLPricePage({
    Key key,
    @required this.predictedPrice,
    @required this.town,
    @required this.flattype,
    @required this.storeyPremium,
    @required this.leasePremium,
    @required this.floorpersqm,
    @required this.address,
  }) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('Results')),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width / 15)),
              child: Center(
                child: Text('Price of the Flat',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width / 15)),
              child: Center(
                child: Text("\$ " + predictedPrice.toStringAsFixed(2),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width / 15)),
              child: Text('Parameters Taken in:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 10)),
                  child: Text('Town:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 2),
                      right: (MediaQuery.of(context).size.width / 98)),
                  child: Text(town,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 10)),
                  child: Text('Flat Type:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 2.4),
                      right: (MediaQuery.of(context).size.width / 98)),
                  child: Text(flattype,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ],
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.width / 15),
                    left: (MediaQuery.of(context).size.width / 10)),
                child: Text('Storey Range:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.width / 15),
                    left: (MediaQuery.of(context).size.width / 2.4),
                    right: (MediaQuery.of(context).size.width / 98)),
                child: Text(storeyPremium.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ]),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 10)),
                  child: Text('Floor per Sqm:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 2.6),
                      right: (MediaQuery.of(context).size.width / 98)),
                  child: Text(floorpersqm.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 10)),
                  child: Text('Lease Remaining:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 3),
                      right: (MediaQuery.of(context).size.width / 98)),
                  child: Text(leasePremium.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 10),
                      right: (MediaQuery.of(context).size.width / 98)),
                  child: Text('Address:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 15),
                      left: (MediaQuery.of(context).size.width / 5)),
                  child: Text(address,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ],
            ),
          ]),
        ));
  }
}
