import 'package:flutter/material.dart';
import 'package:food_delivery/src/payment.dart';

class OrderFrom extends StatefulWidget {
  @override
  _OrderFromState createState() => _OrderFromState();
}

class _OrderFromState extends State<OrderFrom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Delivery Detail",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:15.0),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                      ),
                      onChanged: (value){},
                    ),

                    SizedBox(height:15.0),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                      ),
                      onChanged: (value){},
                    ),

                    SizedBox(height:15.0),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Table No.",
                      ),
                      onChanged: (value){},
                    ),

                    SizedBox(height:15.0),

                    RaisedButton(
                      color: Colors.orangeAccent,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                           return Payment();
                          }
                        ));
                      },
                      child: Text(
                        "Confirm Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
