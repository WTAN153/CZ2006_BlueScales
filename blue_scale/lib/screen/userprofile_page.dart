import 'package:blue_scale/controller/login_controller.dart';
import 'package:blue_scale/entity/user.dart';
import 'package:blue_scale/screen/auth/login_main.dart';
import 'package:flutter/material.dart';
import 'package:blue_scale/entity/DataAccess.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blue_scale/controller/user_controller.dart';

final _formKey = GlobalKey<FormState>();
String _currentName, _currentPhone;
final Color Orange = Color(0xffffab40);
final Color themeColor = Color(0xFFFFF3E0);

class userprofile_page extends StatefulWidget {
  //Userprofiledata currentUser = locator.get<UserController>().currentUser; // profile pic
  @override
  _userprofile_pageState createState() => _userprofile_pageState();
}

class _userprofile_pageState extends State<userprofile_page> {
  final ImagePicker _picker = ImagePicker();
  String _blkno, _address, _phone, _storey, _price;

  @override
  Widget build(BuildContext context) {
    final user = LoginController()
        .getCurrentUID(); // Get current login user id from the firebase
    //final user ='3aaaQuCYAHhfgeTByBPHAqqR11B3';

    return StreamBuilder<Userprofiledata>(
        stream: DataAccess(uid: user).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Userprofiledata userData = snapshot
                .data; //userData now have all the access of the userdata
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
              body: Column(
                children: <Widget>[
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  /*Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      child:Icon(Icons.photo_camera),
                    ),

                  ),*/
                  /*   Avatar(                            // profile pic, but not be implemented because of time
                    onTap: () async {
                      //open gallery to select image
                      await _picker.getImage(source: ImageSource.gallery,);
                      //upload the image to firebase
                      //update current user
                    },
                  ),
*/

                  SizedBox(height: 20.0),
                  Text("Email: ${userData.email}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black)), // edit profile in the futrue
                  SizedBox(height: 20.0),

                  Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        // 2 widget side by side in the column
                        Row(
                            // use row
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Username: ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Container(
                                width: 140,
                                child: TextFormField(
                                  initialValue: userData.name,
                                  decoration: InputDecoration(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  validator: (val) => val.isEmpty
                                      ? 'Please enter a name'
                                      : null, //if no username it will ask for it.
                                  onChanged: (val) =>
                                      setState(() => _currentName = val),
                                ),
                              ),
                            ]),
                        Row(
                            // use row
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Phone no: ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Container(
                                width: 140,
                                child: TextFormField(
                                  initialValue: userData.phone,
                                  decoration: InputDecoration(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  validator: (val) => val.isEmpty
                                      ? 'Please enter a phone'
                                      : null, //if no username it will ask for it.
                                  onChanged: (val) =>
                                      setState(() => _currentPhone = val),
                                ),
                              ),
                            ]),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            // enter to change username
                            color: Colors.pink[400],
                            child: Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await DataAccess(uid: user).updateUserData(
                                    userData.email,
                                    _currentName ??
                                        userData
                                            .name, // store it in the userdatabase with userid
                                    _currentPhone ?? userData.phone);
                                //Navigator.pop(context); //maybe add pop up dialog box here
                              }
                            }),
                        SizedBox(height: 20.0),

                        MaterialButton(
                          // delete the current rent post

                          onPressed: () async {
                            await UserController.storeRent(
                                _blkno = "null".toString().trim(),
                                _address = "null".toString().trim(),
                                _phone = userData.phone.toString().trim(),
                                _storey = "null".toString().trim(),
                                _price = "null".toString().trim());
                            //print(_address);
                            Navigator.of(context).maybePop();
                          },

                          color: Colors.pink[400],

                          child: Text('Delete Post',
                              style: TextStyle(color: Colors.white)),
                          textColor: Colors.white,
                        ),
                        //Text("post: ${rents}" ,style: TextStyle(fontSize: 20, color: Colors.black) ),
                      ])),
                  SizedBox(height: 100.0),
                  MaterialButton(
                    elevation: 1,
                    minWidth: 150, // width of the button
                    height: 50,

                    onPressed: () async {
                      LoginController.signOut();
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    color: Orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),

                    child: Text('Logout',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            );
          } else {
            return Container(width: 0.0, height: 0.0);
          }
        });
  }
}
