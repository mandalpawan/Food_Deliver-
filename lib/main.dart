import 'package:flutter/material.dart';
import 'package:food_delivery/src/admin_deshboard.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:food_delivery/src/sigin_page.dart';
import 'package:provider/provider.dart';
import 'src/main_screen.dart';
import 'src/admin_add_item.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Ordering App",
      theme: ThemeData(
       primaryColor: Colors.blueAccent,
      ),
      //home: Main_screen(),
      //home: AdminDeshBoard(),
        home: SinInPage(),
    );
  }
}