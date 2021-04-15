import 'package:blue_scale/controller/user_controller.dart';
import 'package:blue_scale/screen/rent_function/rentsearch_page.dart';
import 'package:blue_scale/screen/view/error_popup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class rentpost_screen extends StatefulWidget {
  @override
  _rentpost_screenState createState() => _rentpost_screenState();
}

class _rentpost_screenState extends State<rentpost_screen> {
  final Color primaryColor = Color(0xFFFFEEE8);

  final Color secondaryColor = Color(0xff232c51);

  final Color themeColor = Color(0xFFFFEEE8);

  final Color Orange = Color(0xffffab40);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String _blkno, _address, _phone, _storey, _price;

  final listingTitleController = TextEditingController();

  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: MediaQuery.of(context).size.height/10),
                Text('Put up for Rent',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)
                    //style:
                    //GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                    ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                          child: Text(
                        "Block no. : ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/9)),
                      child: Container(
                        width: 225,
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Blk no.',
                              hintText: 'eg. 123',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.grey[50]),
                          onChanged: (value) {
                            _blkno =
                                value.trim(); // store the email typed in _email
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                          child: Text(
                        "Address : ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/7.8)),
                      child: Container(
                        width: 225,
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Address',
                              hintText: 'eg. Jurong street 21',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.grey[50]),
                          onChanged: (value) {
                            _address =
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                          child: Text(
                        "Phone no. : ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width/11)),
                      child: Container(
                        width: 225,
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'phone no.',
                              hintText: 'eg. 912345678',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.grey[50]),
                          onChanged: (value) {
                            _phone =
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                          child: Text(
                        "Storey : ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/5.7)),                      child: Container(
                        width: 225,
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Storey',
                              hintText: 'eg. 5',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.grey[50]),
                          onChanged: (value) {
                            _storey =
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                          child: Text(
                        "Price/Month : ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width/30)),
                      child: Container(
                        width: 225,
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Price ',
                              hintText: 'eg. 123',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.grey[50]),
                          onChanged: (value) {
                            _price =
                                value.trim(); // store the email typed in _email
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: 150,
                  height: 50,
                  onPressed: () async {
                    if (_blkno == null) {
                      await Dialogs.errorAbortDialog(
                          context, 'Please fill up the blk no.');
                      return;
                    }
                    if (_address == null) {
                      await Dialogs.errorAbortDialog(
                          context, 'Please fill up the address');
                      return;
                    }
                    if (_phone == null) {
                      await Dialogs.errorAbortDialog(
                          context, 'Please fill up the phone no');
                      return;
                    }
                    if (_storey == null) {
                      await Dialogs.errorAbortDialog(
                          context, 'Please fill up the storey');
                      return;
                    }
                    if (_price == null) {
                      await Dialogs.errorAbortDialog(
                          context, 'Please fill up the price');
                      return;
                    } else {
                      await UserController.storeRent(
                          _blkno.toString().trim(),
                          _address.toString().trim(),
                          _phone.toString().trim(),
                          _storey.toString().trim(),
                          _price.toString().trim());
                      //print(_address);
                      Navigator.of(context).maybePop();
                    }
                  },
                  color: Orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Post',
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
        )));
  }
}
