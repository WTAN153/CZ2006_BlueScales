import 'package:blue_scale/screen/housepriceSearch/mainSearchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blue_scale/screen/auth/login_main.dart';
import 'package:blue_scale/entity/user.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //User user = Provider.of<User>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BlueScale",
        theme: ThemeData(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        home: LoginScreen());
  }
}

