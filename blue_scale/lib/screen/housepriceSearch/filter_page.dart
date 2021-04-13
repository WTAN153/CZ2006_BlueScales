import 'package:blue_scale/controller/user_controller.dart';
import 'package:blue_scale/screen/rent_function/rentsearch_page.dart';
import 'package:blue_scale/screen/housepriceSearch/searchfilterpage.dart';
import 'package:blue_scale/screen/view/error_popup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:blue_scale/entity/autofillintext.dart';

class filter_screen extends StatefulWidget {
  @override
  _filter_screenState createState() => _filter_screenState();
}

class _filter_screenState extends State<filter_screen> {
  final Color primaryColor = Color(0xFFFFEEE8);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFF3E0);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String _block, _streetname, _room, _storey;

  final listingTitleController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controllerstreet = TextEditingController();
  final controllerblk = TextEditingController();
  final controllerroom = TextEditingController();
  final controllerstry = TextEditingController();

  String selectedstreet, selectedstry;

  void validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  var addressController = TextEditingController();
  // complete the auto fillin box
  @override
  Widget buildstoreyrange() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Container(
                child: Text(
              "Storey range : ",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
            child: Container(
              width: 250,
              height: 50,
              child: TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  style: TextStyle(color: Colors.black),
                  controller: controllerstry,
                  decoration: InputDecoration(
                    labelText: 'Storey range',
                    filled: true,
                    fillColor: Colors.grey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                suggestionsCallback: storeyData.getSuggestions,
                itemBuilder: (context, String suggestion) => ListTile(
                  title: Text(suggestion,
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                onSuggestionSelected: (String suggestion) =>
                    controllerstry.text = suggestion,

                validator: (value) => value != null && value.isEmpty
                    ? 'Please select a storey range'
                    : null,
                //onChanged: (value) => selectedCity = value,
              ),
            ),
          ),
        ],
      );

  Widget build(BuildContext context) {
    Widget buildstreetname() => Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Container(
                  child: Text(
                "Street name : ",
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
              child: Container(
                width: 250,
                height: 50,
                child: TypeAheadFormField<String>(
                  textFieldConfiguration: TextFieldConfiguration(
                    style: TextStyle(color: Colors.black),
                    controller: controllerstreet,
                    decoration: InputDecoration(
                      labelText: 'Street name',
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  suggestionsCallback: CityData.getSuggestions,
                  itemBuilder: (context, String suggestion) => ListTile(
                    title: Text(suggestion,
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  onSuggestionSelected: (String suggestion) =>
                      controllerstreet.text = suggestion,

                  validator: (value) => value != null && value.isEmpty
                      ? 'Please select a city'
                      : null,
                  //onChanged: (value) => selectedCity = value,
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      backgroundColor: themeColor,
      extendBodyBehindAppBar: true,
      body: Center(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Text('Filter Search',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)
                  //style:
                  //GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                  ),
              SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Container(
                        child: Text(
                      "Block : ",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Container(
                      width: 250,
                      height: 50,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            labelText: 'BLK no.',
                            hintText: 'eg. 123',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: Colors.grey[50]),
                        onChanged: (value) {
                          _block =
                              value.trim(); // store the email typed in _email
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildstreetname(),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Container(
                        child: Text(
                      "Room : ",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(57, 0, 0, 0),
                    child: Container(
                      width: 250,
                      height: 50,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            labelText: 'no. Room',
                            hintText: 'eg. 4',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: Colors.grey[50]),
                        onChanged: (value) {
                          _room =
                              value.trim(); // store the email typed in _email
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              buildstoreyrange(),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                minWidth: 150,
                height: 50,
                onPressed: () async {
                  if (_block == null) {
                    await Dialogs.errorAbortDialog(
                        context, 'Please fill up the blk no.');
                    return;
                  }
                  if (controllerstreet.text == '') {
                    await Dialogs.errorAbortDialog(
                        context, 'Please fill up the address');
                    return;
                  }
                  if (_room == null) {
                    await Dialogs.errorAbortDialog(
                        context, 'Please fill up the phone no');
                    return;
                  }
                  if (controllerstry.text == '') {
                    await Dialogs.errorAbortDialog(
                        context, 'Please fill up the storey');
                    return;
                  } else {
                    validateAndSave;

                    print(controllerstreet.text);
                    print(controllerstry.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => searchfilterPage(
                                _block,
                                controllerstreet.text,
                                _room,
                                controllerstry.text)));
                  }
                },
                color: Orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text('search',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                textColor: Colors.white,
              ),
              SizedBox(height: 20),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      )),
    );
  }
}
