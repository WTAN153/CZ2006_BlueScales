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
  ShowMLPricePage({
    Key key,
    @required this.predictedPrice,
  }) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('Results')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text('Price of the Predicted Flat',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              Center(
                child: Text(predictedPrice.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              Text('Parameters Taken in:'),
              TextButton(
                child: Text('Grant Calculator'),
                onPressed: () {
                  // myKey.currentState.readJson();
                },
              )
            ],
          ),
        ));
  }
}
