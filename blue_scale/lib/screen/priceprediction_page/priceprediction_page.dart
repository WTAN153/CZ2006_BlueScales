import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PredictPrice extends StatefulWidget {
  @override
  PredictPricePage createState() => PredictPricePage();
}

class PredictPricePage extends State {
  var excel = Excel.createExcel();
  String town = 'Ang Mo Kio';
  String flattype = '2-room';
  String storeyrange = '1';
  TextEditingController floorpersqmtextfield = TextEditingController();
  TextEditingController blocktextfield = TextEditingController();
  TextEditingController streetnametextfield = TextEditingController();

  String leaseremaining = '1';

  String exceltown, excelflat, excelstorey, excellease, exceladdress;

  Widget townDropDownList() {
    return DropdownButton<String>(
      value: town,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          town = newValue;
        });
      },
      items: //TODO change string to town
          <String>[
        'Ang Mo Kio',
        'Bukit Batok',
        'Bedok',
        'Bishan',
        'Bukit Merah',
        'Bukit Panjang',
        'Bukit Timah',
        'Choa Chu Kang',
        'Clementi',
        'Central Area',
        'Geylang',
        'Hougang',
        'Jurong East',
        'Jurong West',
        'Kallang/Whampoa',
        'Marine Parade',
        'Punggol',
        'Pasir Ris',
        'Queenstown',
        'Sembawang',
        'Serangoon',
        'Sengkang',
        'Tampines',
        'Tengah',
        'Toa Payoh',
        'Woodlands',
        'Yishun'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget flatTypeDropDownList() {
    return DropdownButton<String>(
      value: flattype,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          flattype = newValue;
        });
      },
      items: <String>[
        '2-room',
        '3-room',
        '4-room',
        '5-room',
        'Adjoined Flat',
        'Apartment',
        'DBSS',
        'Improved',
        'Improved Maisonette',
        'Masionettee',
        'Model A',
        'Model A2',
        'Model A-Masionette',
        'Multi Generation',
        'New Generation',
        'Premium Apartment',
        'Premium Apartment Loft',
        'Premium Maisonette',
        'Simplified',
        'Standard',
        'Terrace',
        'Type S1',
        'Type S2',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }

  Widget storeyDropDownList() {
    List<String> doubleList =
        List<String>.generate(51, (int index) => '${index * 1 + 1}');
    List<DropdownMenuItem> storeyRangeList = doubleList
        .map((val) => DropdownMenuItem(value: val, child: Text(val)))
        .toList();
    return DropdownButton<String>(
        value: storeyrange,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            storeyrange = newValue;
          });
        },
        items: storeyRangeList);
  }

  Widget leaseDropDownList() {
    List<String> doubleList =
        List<String>.generate(99, (int index) => '${index * 1 + 1}');
    List<DropdownMenuItem> leaseList = doubleList
        .map((val) => DropdownMenuItem(value: val, child: Text(val)))
        .toList();
    return DropdownButton<String>(
        value: leaseremaining,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            leaseremaining = newValue;
          });
        },
        items: leaseList);
  }

  String getTown() {
    setState(() {
      exceltown = town;
    });

    return exceltown;
  }

  String getLease() {
    setState(() {
      excellease = leaseremaining;
    });

    return excellease;
  }

  String getFlat() {
    setState(() {
      excelflat = flattype;
    });

    return excelflat;
  }

  String getStorey() {
    setState(() {
      excelstorey = storeyrange;
    });

    return excelstorey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Predict Price for Flat')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                child: Text(
                  'Please Input the respective field to predict price of desired flat',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text(
                      'Town Name: ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: townDropDownList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text(
                      'Flat Model: ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: flatTypeDropDownList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text(
                      'Storey Range: ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: storeyDropDownList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text(
                      'Remaining Lease in Years: ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: leaseDropDownList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text('Floor per square metre: ',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Container(
                      width: 140,
                      height: 40,
                      child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Floor per sqm',
                          ),
                          controller: floorpersqmtextfield,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          validator: (String value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some numbers';
                            }
                            return null;
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 100,
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text('Block number: ',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Block Number',
                        ),
                        controller: blocktextfield,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some numbers';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text('Street Name: ',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10),
                        top: (MediaQuery.of(context).size.width / 100)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width / 10)),
                      child: Container(
                        width: 140,
                        height: 40,
                        child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[ a-zA-z0-9 ]"))
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Street Name',
                            ),
                            controller: streetnametextfield,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter something!';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                  child: Text('Ni Hao!'),
                  onPressed: () {
                    _sendDataToPredictPrice(context);
                  }),
            ],
          ),
        ));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$excel.xlsn');
  }

  void _sendDataToPredictPrice(BuildContext context) async {
    int floorsqm = int.parse(floorpersqmtextfield.text);
    String blockNumber = blocktextfield.text;
    String streetName = streetnametextfield.text;

    String combined = blockNumber + streetName;
    Sheet sheetObject = excel['Sheet1'];
    print('checking');
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/excel');
    var cellTown = sheetObject.cell(CellIndex.indexByString("A2"));
    cellTown.value = exceltown;
    var cellFlat = sheetObject.cell(CellIndex.indexByString("B2"));
    cellFlat.value = excelflat;
    var cellStorey = sheetObject.cell(CellIndex.indexByString("C2"));
    cellStorey.value = excelstorey;
    var cellFloorPerSqm = sheetObject.cell(CellIndex.indexByString("D2"));
    cellFloorPerSqm.value = floorsqm;
    var cellLease = sheetObject.cell(CellIndex.indexByString("E2"));
    cellLease.value = excellease;
    var cellBlockStreet = sheetObject.cell(CellIndex.indexByString("F2"));
    cellBlockStreet.value = combined;

    excel.encode().then((onValue) {
      File(join("excel.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
  }
}
