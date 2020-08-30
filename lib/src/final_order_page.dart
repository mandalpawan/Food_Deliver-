import 'package:flutter/material.dart';

class OrderFinal extends StatefulWidget {
  @override
  _OrderFinalState createState() => _OrderFinalState();
}

class _OrderFinalState extends State<OrderFinal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme:  IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
              "Your Order",
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Orders",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Product details",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.redAccent,
                            ),

                            SizedBox(width: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Food Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0
                                  ),
                                ),
                                SizedBox(height: 15.0,),
                                Text(
                                    "Food Detail"
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 10.0,),

                        Text(
                          "Delivery details",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: 5.0,),
                        Text("Name : Pawan Mandal "),
                        SizedBox(height: 5.0,),
                        Text("Phone No. : 8603587194"),
                        SizedBox(height: 5.0,),
                        Text("Table No. : 5"),
                        SizedBox(height: 5.0,),
                        Text("Payment Method : COD"),

                        SizedBox(height: 10.0,),

                        Text(
                          "Order Status",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.adjust,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Ordered",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                    Icons.adjust
                                ),
                                Text(
                                  "Processing",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.adjust,
                                ),
                                Text(
                                  "Out Of Delivery",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.adjust,
                                ),
                                Text(
                                  "Delivered",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
