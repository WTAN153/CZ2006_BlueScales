import 'file:///C:/Users/tzkai/AndroidStudioProjects/CZ2006_BlueScales/blue_scale/lib/screen/auth/login_main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blue_scale/screen/welcome_page.dart';
import 'package:blue_scale/controller/login_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';



class RegisterScreen extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color Orange = Color(0xffffab40);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool verifiedRegister;

  String _email ,_password,_cpassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color:Colors.black,
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        backgroundColor: primaryColor,
        extendBodyBehindAppBar: true,
        body:Center(
          child:Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/backgroundtheme.jpg'),

            fit: BoxFit.cover)
            ),



          alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 90),

                Text(
                  'Register',
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orangeAccent,fontSize: 60,fontWeight: FontWeight.bold)
                  //style:
                  //GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                ),
                Container(
                 width: 350,
                  child:TextField(obscureText: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.grey[50]
                    ),
                    onChanged: (value) {
                      _email =
                          value.trim(); // store the email typed in _email
                    },
                  ),
                ),
                SizedBox(height: 20),
                //_buildTextField(passwordController, Icons.lock, 'Password'),
                Container(
                  width: 350,
                  child:TextField(obscureText: true, // mask the password typed
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.grey[50]),
                    onChanged: (value) {
                      _password = value
                          .trim(); // store the password typed in the _password
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                  child:TextField(obscureText: true, // mask the password typed
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.grey[50]),
                    onChanged: (value) {
                      _cpassword = value
                          .trim(); // store the password typed in the _password
                    },
                  ),
                ),




                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: 150,
                  height: 50,
                  onPressed: ()  async {
                    try {
                      verifiedRegister = await LoginController.verifyregistration(_email.toString().trim(),_password.toString().trim(),_cpassword.toString().trim());  // LoginController
                      if (verifiedRegister == true) {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => WelcomePage()));

                        print('success');

                      }
                      else if (verifiedRegister == false)
                        {
                          Fluttertoast.showToast(msg: 'Re-Enter Password again', gravity: ToastGravity.TOP);
                        }
                    } on FirebaseAuthException catch (error) {
                      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
                    }


                  },


                  color: Orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Register',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),

                SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomCenter,
                  //child: _buildFooterLogo(),
                )
              ],
            ),
          ),
        )
        )
    );
  }



  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}