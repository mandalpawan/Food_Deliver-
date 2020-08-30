import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/card_database.dart';
import 'package:food_delivery/src/card_model.dart';
import 'package:food_delivery/src/order_adress_form.dart';
import 'package:food_delivery/src/order_card.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:provider/provider.dart';



class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    double Price ;
    double discount;
    double total;

    //CardModel userdata = snapshot.data;
    return StreamBuilder(
        stream: CardDataServices(uid: user.uid).CardData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.documents.length);
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    print(ds['price']);

                    Price = double.parse(ds['price']) ;
                    discount = double.parse(ds['discount']) ;

                    total = double.parse(ds['price']) * double.parse(ds['quantity']);

                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[

                          SizedBox(height: 10.0,),

                          Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(width: 20.0,),
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    child: Image.network(ds['image']),
                                  ),
                                  SizedBox(width: 20.0,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(ds['title'],style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 6.0,),
                                      Text("\u20B9 "+ ds['price'],
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.cancel,color: Colors.grey,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total Amount",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Rs "+ds['price'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Discount",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Rs "+ds['discount'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.0,),


                          Divider(height: 35.0, color: Color(0xFFD3D3D3),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Sub Amount",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                total.toString() ,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 40.0,),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return OrderFrom();
                                  })
                              );
                            },
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Process to Checkout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }
              ),
            );
          } else {
            return Text("Loading...");
          }
        }
    );
  }
}




