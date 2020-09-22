import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/page/login.dart';
import 'package:food_delivery/page/spash.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/product.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/src/admin_deshboard.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:food_delivery/src/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
    ),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),

  ], child: MyApp()

  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.orangeAccent
      ),
      home: ScreensController(),
    );
  }
}


class connectivityresult extends StatefulWidget {
  @override
  _connectivityresultState createState() => _connectivityresultState();
}

class _connectivityresultState extends State<connectivityresult> {

  StreamSubscription connection;
  ConnectivityResult oldres;

  bool conn = true;

  @override
  void initState() {
    super.initState();
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult resultnow) {
      if(resultnow == ConnectivityResult.none){
        print("Not connected");
        conn = false;
      }
      else if(oldres == ConnectivityResult.none){
        print("connected");
        conn = true;
      }
      
      oldres = resultnow;
    });
  }



  @override
  Widget build(BuildContext context) {
    print(conn);
    return  conn ? Container(child: Text("Connected"),): Container(child: Text("Not connected"),);
  }
}




class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return  user.userModel.userType == "admin"?  AdminDeshBoard() : Main_screen();
        //return AdminDeshBoard();
      default: return Login();
    }
  }
}

