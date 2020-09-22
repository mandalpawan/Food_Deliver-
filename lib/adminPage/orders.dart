import 'package:flutter/material.dart';
import 'package:food_delivery/model/order.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Orders"
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(

        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: user.ordersAll.length,
              itemBuilder: (_, index){
                OrderModel _order = user.ordersAll[index];
                return Column(
                    children:<Widget>[
                      Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Order No.\n "+ user.ordersAll[index].id,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0
                                ),
                              ),

                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: user.ordersAll[index].cart.length,
                                  itemBuilder: (_ , indexs) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(35.0),
                                                child: Container(
                                                  height: 70.0,
                                                  width: 70.0,
                                                  child: Image.network(
                                                    user.ordersAll[index].cart[indexs]["image"],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.0,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    user.ordersAll[index].cart[indexs]["name"],
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\u20B9 " + user.ordersAll[index].cart[indexs]["price"],
                                                        style: TextStyle(
                                                            color: Colors.orangeAccent
                                                        ),
                                                      ),
                                                      Text(
                                                          " x "
                                                      ),
                                                      Text(
                                                          user.ordersAll[index].cart[indexs]["quantity"]
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                "Total Amount\t\t \u20B9 "+ user.ordersAll[index].total.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                "Payment Mode : Case",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),

                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                'Delivery Detail :',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                  'Name : Pawan Mandal'
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                  'Mobile Number : 8603587194'
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                  'Table No. : 05'
                              ),
                              SizedBox(height: 15.0,),
                              RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                color: Colors.orangeAccent,
                                onPressed: (){},
                                child: Text(
                                  "Process",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                );
              }
          ),
        ),
      ),
    );
  }
}