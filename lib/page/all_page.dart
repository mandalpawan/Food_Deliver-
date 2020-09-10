import 'package:flutter/material.dart';
import 'package:food_delivery/src/favorite_page.dart';

class AllItem extends StatefulWidget {
  @override
  _AllItemState createState() => _AllItemState();
}

class _AllItemState extends State<AllItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Food Items"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Favorate(),
    );
  }
}
