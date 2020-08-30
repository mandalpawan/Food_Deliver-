import 'package:flutter/material.dart';
import 'package:food_delivery/src/cart_notifier.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:food_delivery/src/service_auth.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:food_delivery/src/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Ordering App",
        theme: ThemeData(
         primaryColor: Colors.blueAccent,
        ),
        home: Wrapper(),
      ),
    );
  }
}