import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blue_scale/screen/welcome_page.dart';
import 'package:blue_scale/screen/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blue_scale/controller/login_controller.dart';
import 'package:flutter/gestures.dart';





class LoginScreen extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color Orange = Color(0xffffab40);

  //final LoginController Login = new LoginController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  //Future<bool> verifiedLogin;
  bool verifiedLogin;
  String _email, _password;


  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false, //prevent scrolling


        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
      body: Center(

        child:Container(

          width: double.infinity,
          height: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/loginscreen.jpg'),

        fit: BoxFit.cover)
        ),



        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 170),
              Text(
                'HOUSE-IN',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orangeAccent,fontSize: 60,fontWeight: FontWeight.bold)

              ),
              SizedBox(
                height: 40,
              ),
              //_buildTextField(nameController, Icons.account_circle, 'Username'), // store name here
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
              SizedBox(height: 30),
              Align(
                alignment: Alignment(0.7,0), // make button position to the right
                child:
                MaterialButton(
                elevation: 1,
                minWidth:150, // width of the button
                height: 50,

                onPressed: () async {
                  try {
                    verifiedLogin = await LoginController.verifylogin(_email.toString().trim(), _password.toString().trim()); // LoginController
                    if (verifiedLogin == true) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage()));
                      print('success');
                    }
                  } on FirebaseAuthException catch (error) {
                    Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
                  }
                }
                ,color: Orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

                 child: Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 20)),

              ),
              ),


              SizedBox(height: 50),

              //SizedBox(height: 100),
              //SizedBox(height: 20),
              Align(
                alignment: Alignment(0, 0.0),
                child: RichText(
                  text: TextSpan(
                    text:'Sign-Up, ',style: TextStyle(color: Colors.black,fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'here', style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold ,fontSize: 25),
                          recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                      )
                    ]
                  )
                )
              ),
            ],
          ),
        ),



    )
      )
    );





  }


    _buildTextField(TextEditingController controller, IconData icon,
        String labelText) {
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







