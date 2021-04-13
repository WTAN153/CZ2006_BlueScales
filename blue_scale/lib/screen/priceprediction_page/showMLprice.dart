import 'dart:convert';
import 'dart:io';

import 'package:blue_scale/screen/priceprediction_page/priceprediction_page.dart';
import 'package:flutter/material.dart';

class ShowMLPrice extends StatefulWidget {
  final GlobalKey<PredictPricePage> myKey;
  ShowMLPrice(this.myKey);
  @override
  ShowMLPricePage createState() => ShowMLPricePage();
}

class ShowMLPricePage extends State {
  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('Results')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Price of the Predicted Flat'),
              Text('Price'), //TODO add in ML price
              Text('Parameters Taken in:'),
              TextButton(
                child: Text('testing!'),
                onPressed: () {
                  // myKey.currentState.readJson();
                },
              )
            ],
          ),
        ));
  }
}
