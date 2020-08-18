import "package:flutter/material.dart";


class SerchBox extends StatefulWidget {
  @override
  _SerchBoxState createState() => _SerchBoxState();
}

class _SerchBoxState extends State<SerchBox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 25.0),
          hintText: "Search any food",
          suffixIcon: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Icon(Icons.search,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
