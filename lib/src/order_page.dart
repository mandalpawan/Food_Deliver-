import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/card_database.dart';
import 'package:food_delivery/src/order_adress_form.dart';
import 'package:food_delivery/src/order_card.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    double Price ;
    double discount;
    double total = 0;
    double subtotal = 0;


    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sub TOTAL",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    subtotal.toString(),
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              Spacer(),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                color: Colors.orangeAccent,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return OrderFrom();
                      })
                  );
                },
                child: Text(
                  "Check out",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),

                ),
              ),
            ],
          ),
        ),
      ),

      body: Container(
        child: StreamBuilder(
      stream: CardDataServices(uid: user.uid).CardData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.documents.length);
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];

                    Price = double.parse(ds['price']) ;
                    discount = double.parse(ds['discount']) ;

                    total = double.parse(ds['price']) * double.parse(ds['quantity']);
                    subtotal = subtotal + total;

                    print(subtotal);


                    return Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5.0,),
                          Card(
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
                                    Text("\u20B9 "+ ds['price']+" x " + ds['quantity'] ,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(height: 6.0,),
                                    Text("\u20B9 "+ total.toString(),
                                      style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Icon(Icons.cancel,color: Colors.grey,),
                                ),
                              ],
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
    ),
      ),
    );
  }
}
