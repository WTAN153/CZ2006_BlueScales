import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:convert';

import 'package:blue_scale/screen/priceprediction_page/showMLprice.dart';

GlobalKey<PredictPricePage> myKey = GlobalKey();
// class PriceParameter {
//   final String town;
//   final String flatType;
//   final String storeyRange;
//   final String floorPerSqm;
//   final String address;

//   PriceParameter(this.town, this.flatType, this.storeyRange, this.floorPerSqm,
//       this.address);

//   PriceParameter.fromJson(Map<String, dynamic> json)
//       : town = json['town'],
//         flatType = json['flatType'],
//         storeyRange = json['storeyRange'],
//         floorPerSqm = json['floorPerSqm'],
//         address = json['address'];

//   Map<String, dynamic> toJson() => {
//         'town': town,
//         'flatType': flatType,
//         'storeyRange': storeyRange,
//         'floorPerSqm': floorPerSqm,
//         'address': address
//       };
// }

class PredictPrice extends StatefulWidget {
  const PredictPrice({Key key}) : super(key: key);
  @override
  PredictPricePage createState() => PredictPricePage();
}

class PredictPricePage extends State {
  GlobalKey<PredictPricePage> myKey = GlobalKey();
  String town = 'Ang Mo Kio';
  String flattype = 'Adjoined Flat';
  String storeyrange = '1';
  TextEditingController floorpersqmtextfield = TextEditingController();
  TextEditingController blocktextfield = TextEditingController();
  TextEditingController streettowntextfield = TextEditingController();

  String leaseremaining = '99';

  String exceltown, excelflat, excelstorey, excellease, exceladdress;
  int townPremium, flatPremium, storeyPremium, leasePremium;

  File jsonFile;
  Directory dir;
  String fileName = 'form.json';
  bool fileExists = false;
  Map<String, dynamic> fileContent;

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
      items: <String>[
        'Ang Mo Kio',
        'Bedok',
        'Bishan',
        'Bukit Batok',
        'Bukit Merah',
        'Bukit Panjang',
        'Bukit Timah',
        'Central Area',
        'Choa Chu Kang',
        'Clementi',
        'Geylang',
        'Hougang',
        'Jurong East',
        'Jurong West',
        'Kallang/Whampoa',
        'Marine Parade',
        'Pasir Ris',
        'Punggol',
        'Queenstown',
        'Sembawang',
        'Serangoon',
        'Sengkang',
        'Tampines',
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
        // '2-room',
        // '3-room',
        // '4-room',
        // '5-room',
        'Adjoined Flat',
        // 'Apartment',
        'DBSS',
        'Improved',
        // 'Improved Maisonette',
        // 'Masionettee',
        'Model A',
        'Model A2',
        // 'Model A-Masionette',
        // 'Multi Generation',
        'New Generation',
        'Premium Apartment',
        'Premium Apartment Loft',
        // 'Premium Maisonette',
        'Simplified',
        'Standard',
        // 'Terrace',
        'Type S1',
        // 'Type S2',
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
        List<String>.generate(99, (int index) => '${99 - index * 1}');
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

  int getTown() {
    setState(() {
      switch (town) {
        case "Ang Mo Kio":
          {
            townPremium = 7620;
          }
          break;

        case "Bedok":
          {
            townPremium = 1490;
          }
          break;

        case "Bishan":
          {
            townPremium = 83870;
          }
          break;

        case "Bukit Batok":
          {
            townPremium = 57450;
          }
          break;

        case "Bukit Merah":
          {
            townPremium = 55000;
          }
          break;
        case "Bukit Panjang":
          {
            townPremium = 77060;
          }
          break;

        case "Bukit Timah":
          {
            townPremium = 185330;
          }
          break;

        case "Central Area":
          {
            townPremium = 37120;
          }
          break;

        case "Choa Chu Kang":
          {
            townPremium = 110680;
          }
          break;

        case "Clementi":
          {
            townPremium = 64200;
          }
          break;

        case "Geylang":
          {
            townPremium = 16630;
          }
          break;

        case "Hougang":
          {
            townPremium = 49750;
          }
          break;

        case "Jurong East":
          {
            townPremium = 35650;
          }
          break;

        case "Jurong West":
          {
            townPremium = 79770;
          }
          break;

        case "Kallang/Whampoa":
          {
            townPremium = 11480;
          }
          break;

        case "Marine Parade":
          {
            townPremium = 221780;
          }
          break;

        case "Pasir Ris":
          {
            townPremium = 17730;
          }
          break;

        case "Punggol":
          {
            townPremium = 69750;
          }
          break;

        case "Queenstown":
          {
            townPremium = 89620;
          }
          break;

        case "Sembawang":
          {
            townPremium = 125020;
          }
          break;

        case "Sengkang":
          {
            townPremium = 77560;
          }
          break;

        case "Serangoon":
          {
            townPremium = 37480;
          }
          break;

        case "Tampines":
          {
            townPremium = 1970;
          }
          break;

        case "Toa Payoh":
          {
            townPremium = 34820;
          }
          break;

        case "Woodlands":
          {
            townPremium = 77120;
          }
          break;

        case "Yishun":
          {
            townPremium = 66940;
          }
          break;
      }
    });

    return townPremium;
  }

  int getLease() {
    setState(() {
      leasePremium = int.parse(leaseremaining);
    });

    return leasePremium;
  }

  int getFlat() {
    setState(() {
      switch (flattype) {
        case "Adjoined Flat":
          {
            flatPremium = 23940;
          }
          break;

        case "DBSS":
          {
            flatPremium = 81230;
          }
          break;

        case "Improved":
          {
            flatPremium = 48140;
          }
          break;

        case "Model A":
          {
            flatPremium = 23960;
          }
          break;

        case "Model A2":
          {
            flatPremium = 21260;
          }
          break;
        case "New Generation":
          {
            flatPremium = 12400;
          }
          break;

        case "Premium Apartment":
          {
            flatPremium = 7170;
          }
          break;

        case "Premium Apartment Loft":
          {
            flatPremium = 11560;
          }
          break;

        case "Simplified":
          {
            flatPremium = 27620;
          }
          break;

        case "Standard":
          {
            flatPremium = 55970;
          }
          break;

        case "Type S1":
          {
            flatPremium = 102920;
          }
          break;
      }
    });

    return flatPremium;
  }

  int getStorey() {
    setState(() {
      storeyPremium = int.parse(storeyrange);
    });

    return storeyPremium;
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
                      'Town: ',
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
                        right: (MediaQuery.of(context).size.width / 10)),
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
                  Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.of(context).size.width / 10)),
                    child: Container(
                      width: 140,
                      height: 40,
                      child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[A-Z0-9]"))
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
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text('Street town: ',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.of(context).size.width / 10),
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
                              labelText: 'Street town',
                            ),
                            controller: streettowntextfield,
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
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.width / 5)),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      child: Text('Enter'),
                      onPressed: () {
                        //_sendDataToPredictPrice(context);
                        writeToFile();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowMLPrice(myKey)));
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  // void _sendDataToPredictPrice(BuildContext context) async {
  //   int floorsqm = int.parse(floorpersqmtextfield.text);
  //   String blockNumber = blocktextfield.text;
  //   String streettown = streettowntextfield.text;
  //   print('can get file');
  //   String combined = blockNumber + streettown;
  //   ByteData data = await rootBundle.load("assets/form.xlsx");
  //   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   var excel = Excel.decodeBytes(bytes);
  //   Sheet sheetObject = excel['Sheet1'];
  //   print('checking');

  //   // var cellTown = sheetObject.cell(CellIndex.indexByString("A2"));
  //   // cellTown.value = exceltown;
  //   // var cellFlat = sheetObject.cell(CellIndex.indexByString("B2"));
  //   // cellFlat.value = excelflat;
  //   // var cellStorey = sheetObject.cell(CellIndex.indexByString("C2"));
  //   // cellStorey.value = excelstorey;
  //   // var cellFloorPerSqm = sheetObject.cell(CellIndex.indexByString("D2"));
  //   // cellFloorPerSqm.value = floorsqm;
  //   // var cellLease = sheetObject.cell(CellIndex.indexByString("E2"));
  //   // cellLease.value = excellease;
  //   // var cellBlockStreet = sheetObject.cell(CellIndex.indexByString("F2"));
  //   // cellBlockStreet.value = combined;

  //   print('before saving');
  //   excel.encode().then((onValue) {
  //     File(join("assets/form.xlsx"))
  //       ..createSync(recursive: true)
  //       ..writeAsBytesSync(onValue);
  //   });
  //   print('all clear');
  // }

  @override
  void initState() {
    super.initState();
    getExternalStorageDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(
      Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile() {
    print("Writing to file!");
    String floorsqm = (floorpersqmtextfield.text);
    String blockNumber = blocktextfield.text;
    String streettown = streettowntextfield.text;
    String address = blockNumber + ' ' + streettown;
    getTown();
    getFlat();
    getStorey();
    getLease();

    Map<String, dynamic> content = {
      "Town": exceltown,
      "FlatType": excelflat,
      "StoreyRange": excelstorey,
      "LeaseRemaining": excellease,
      "floorPerSqm": floorsqm,
      "address": exceladdress
    };
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  void readJson() async {
    // Initialize jsonFile
    jsonFile = await _localFile;

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (fileExists) {
      try {
        //1. Read fileName<String> from the _file.
        fileContent = json.decode(jsonFile.readAsStringSync());
        print(fileContent);
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
      }
    }
  }
}
