import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:convert';
import 'package:requests/requests.dart';
import 'package:blue_scale/screen/priceprediction_page/showMLprice.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

displayToastMessage(String message, BuildContext context) {
  return Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
}

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
  double predictedPrice;
  String town = 'Ang Mo Kio';
  String flattype = 'Adjoined Flat';
  String storeyrange = '1';
  TextEditingController floorpersqmtextfield = TextEditingController();
  TextEditingController blocktextfield = TextEditingController();
  TextEditingController streettowntextfield = TextEditingController();

  String leaseremaining = '99';
  int townPremium, flatPremium, storeyPremium, leasePremium;

  bool proceed;

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
                        left: (MediaQuery.of(context).size.width / 3),
                        right: (MediaQuery.of(context).size.width / 98)),
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
                        left: (MediaQuery.of(context).size.width / 7),
                        right: (MediaQuery.of(context).size.width / 98)),
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
                        left: (MediaQuery.of(context).size.width / 2.25),
                        right: (MediaQuery.of(context).size.width / 98)),
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
                        left: (MediaQuery.of(context).size.width / 4.6),
                        right: (MediaQuery.of(context).size.width / 98)),
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
                        left: (MediaQuery.of(context).size.width / 90),
                        right: (MediaQuery.of(context).size.width / 98)),
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
                width: (MediaQuery.of(context).size.width / 50),
                height: (MediaQuery.of(context).size.height / 50),
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
                        left: (MediaQuery.of(context).size.width / 5.7),
                        right: (MediaQuery.of(context).size.width / 98)),
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
              SizedBox(
                width: (MediaQuery.of(context).size.width / 50),
                height: (MediaQuery.of(context).size.height / 50),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 10)),
                    child: Text('Street: ',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width / 4.7),
                        right: (MediaQuery.of(context).size.width / 98)),
                    child: Container(
                      width: 180,
                      height: 40,
                      child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[ a-zA-z0-9 ]"))
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Street',
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
                      onPressed: () async {
                        String blockNumber2 = blocktextfield.text;
                        String streettown2 = streettowntextfield.text;
                        String address2 = blockNumber2 + ' ' + streettown2;

                        var query_string2 =
                            'https://developers.onemap.sg/commonapi/search?searchVal=' +
                                address2 +
                                '&returnGeom=Y&getAddrDetails=N';
                        var resp2 = await Requests.get(query_string2);
                        String data2 =
                            resp2.content(); //content of data1 has the request

                        Map<String, dynamic> user2 = jsonDecode(data2);

                        if (user2["found"] == 1) {
                          print('got something');
                          proceed = true;
                        } else
                          proceed = false;
                        getLease();
                        int floorsqm = int.parse(floorpersqmtextfield.text);
                        String address = blocktextfield.text +
                            ' ' +
                            streettowntextfield.text;
                        if (proceed == true) {
                          String blockNumber = blocktextfield.text;
                          String streettown = streettowntextfield.text;
                          String address = blockNumber + ' ' + streettown;
                          ByteData data =
                              await rootBundle.load("assets/datasheet.xlsx");
                          var bytes = data.buffer.asUint8List(
                              data.offsetInBytes, data.lengthInBytes);
                          var excel = Excel.decodeBytes(bytes);
                          double lat2, long2;
                          int floorsqm = int.parse(floorpersqmtextfield.text);
                          getTown();
                          getFlat();
                          getStorey();
                          getLease();

                          var sheet = excel['Sheet1'];
                          var query_string =
                              'https://developers.onemap.sg/commonapi/search?searchVal=' +
                                  address +
                                  '&returnGeom=Y&getAddrDetails=N';
                          var resp = await Requests.get(query_string);
                          String data1 =
                              resp.content(); //content of data1 has the request
                          // var locFile = resp.json();

                          print(data1);
                          Map<String, dynamic> user = jsonDecode(data1);

                          try {
                            List<dynamic> data5 = user["results"];

                            double lat1 = double.parse(data5[0]["LATITUDE"]);
                            double long1 = double.parse(data5[0]["LONGITUDE"]);

                            long1 = long1 * math.pi / 180;
                            lat1 = lat1 * math.pi / 180;

                            int r = 6371000;
                            String closest_mrt = '';
                            double smallest_dist = 10000;
                            String mrtName, timeTaken;
                            int timemrt;

                            for (int i = 2; i <= 122; i++) {
                              String cellLong = 'E' + i.toString();
                              String cellLat = 'F' + i.toString();
                              String mrt = 'A' + i.toString();
                              String cellTime = 'B' + i.toString();

                              var cellE =
                                  sheet.cell(CellIndex.indexByString(cellLong));
                              long2 = double.parse(cellE.value);

                              var cellF =
                                  sheet.cell(CellIndex.indexByString(cellLat));
                              lat2 = double.parse(cellF.value);

                              var cellA =
                                  sheet.cell(CellIndex.indexByString(mrt));
                              mrtName = cellA.value;

                              var cellB =
                                  sheet.cell(CellIndex.indexByString(cellTime));
                              timeTaken = cellB.value.toString();

                              long2 = long2 * math.pi / 180;
                              lat2 = lat2 * math.pi / 180;

                              double a = math.sin((lat2 - lat1) / 2) *
                                      math.sin((lat2 - lat1) / 2) +
                                  math.cos(lat1) *
                                      math.cos(lat2) *
                                      math.sin((long2 - long1) / 2) *
                                      math.sin((long2 - long1) / 2);

                              double c = 2 * math.asin(math.sqrt(a));

                              double totaldist = c * r;

                              if (totaldist < smallest_dist) {
                                smallest_dist = totaldist;
                                closest_mrt = mrtName;
                                timemrt = int.parse(timeTaken);
                              }
                            }
                            double timetaken = smallest_dist / 80;

                            predictedPrice = 61000 +
                                flatPremium +
                                townPremium +
                                3790 * storeyPremium +
                                2820 * floorsqm +
                                4260 * leasePremium -
                                5740 * timetaken -
                                5430 * timemrt;
                          } catch (e) {
                            print("Undefined Address");
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowMLPricePage(
                                      predictedPrice: predictedPrice,
                                      town: town,
                                      flattype: flattype,
                                      storeyPremium: storeyPremium,
                                      leasePremium: leasePremium,
                                      floorpersqm: floorsqm,
                                      address: address)));
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Invalid Address! Please try again',
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.black,
                            backgroundColor: Colors.blue,
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  // void getPredictedPrice() async {
  //   String blockNumber = blocktextfield.text;
  //   String streettown = streettowntextfield.text;
  //   String address = blockNumber + ' ' + streettown;
  //   ByteData data = await rootBundle.load("assets/datasheet.xlsx");
  //   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   var excel = Excel.decodeBytes(bytes);
  //   double lat2, long2;
  //   int floorsqm = int.parse(floorpersqmtextfield.text);
  //   getTown();
  //   getFlat();
  //   getStorey();
  //   getLease();

  //   var sheet = excel['Sheet1'];
  //   var query_string =
  //       'https://developers.onemap.sg/commonapi/search?searchVal=' +
  //           address +
  //           '&returnGeom=Y&getAddrDetails=N';
  //   var resp = await Requests.get(query_string);
  //   String data1 = resp.content(); //content of data1 has the request
  //   // var locFile = resp.json();

  //   print(data1);
  //   Map<String, dynamic> user = jsonDecode(data1);

  //   try {
  //     List<dynamic> data5 = user["results"];

  //     double lat1 = double.parse(data5[0]["LATITUDE"]);
  //     double long1 = double.parse(data5[0]["LONGITUDE"]);

  //     long1 = long1 * math.pi / 180;
  //     lat1 = lat1 * math.pi / 180;

  //     int r = 6371000;
  //     String closest_mrt = '';
  //     double smallest_dist = 10000;
  //     String mrtName, timeTaken;
  //     int timemrt;

  //     for (int i = 2; i <= 122; i++) {
  //       String cellLong = 'E' + i.toString();
  //       String cellLat = 'F' + i.toString();
  //       String mrt = 'A' + i.toString();
  //       String cellTime = 'B' + i.toString();

  //       var cellE = sheet.cell(CellIndex.indexByString(cellLong));
  //       long2 = double.parse(cellE.value);

  //       var cellF = sheet.cell(CellIndex.indexByString(cellLat));
  //       lat2 = double.parse(cellF.value);

  //       var cellA = sheet.cell(CellIndex.indexByString(mrt));
  //       mrtName = cellA.value;

  //       var cellB = sheet.cell(CellIndex.indexByString(cellTime));
  //       timeTaken = cellB.value.toString();

  //       long2 = long2 * math.pi / 180;
  //       lat2 = lat2 * math.pi / 180;

  //       double a = math.sin((lat2 - lat1) / 2) * math.sin((lat2 - lat1) / 2) +
  //           math.cos(lat1) *
  //               math.cos(lat2) *
  //               math.sin((long2 - long1) / 2) *
  //               math.sin((long2 - long1) / 2);

  //       double c = 2 * math.asin(math.sqrt(a));

  //       double totaldist = c * r;

  //       if (totaldist < smallest_dist) {
  //         smallest_dist = totaldist;
  //         closest_mrt = mrtName;
  //         timemrt = int.parse(timeTaken);
  //       }
  //     }
  //     double timetaken = smallest_dist / 80;

  //     predictedPrice = 61000 +
  //         flatPremium +
  //         townPremium +
  //         3790 * storeyPremium +
  //         2820 * floorsqm +
  //         4260 * leasePremium -
  //         5740 * timetaken -
  //         5430 * timemrt;
  //   } catch (e) {
  //     print("Undefined Address");
  //   }
  // }
}
