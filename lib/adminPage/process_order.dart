import 'package:flutter/material.dart';
import 'package:food_delivery/adminPage/loading_page_admin.dart';
import 'package:food_delivery/model/order.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/services/order.dart';
import 'package:provider/provider.dart';

class process_order extends StatefulWidget {
  @override
  _process_orderState createState() => _process_orderState();
}

class _process_orderState extends State<process_order> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    final appload = Provider.of<AppProvider>(context);

    user.getAllOrder();


    OrderServices orderService =  OrderServices();

    void _showDialog(String orderid,String status) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Cancel Ordered"),
            content: new Text("Are you suru to cancel order?"),
            actions: <Widget>[
              FlatButton(
                child: new Text("Yes"),
                onPressed: () {
                  orderService.CancelOrder(uid: orderid,status: status);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orangeAccent,
        title: Text(
            "Order "
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: appload.isLoading ? LoadingPage() : SingleChildScrollView(

        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: user.ordersAll.length,
              itemBuilder: (_, index){
                OrderModel _order = user.ordersAll[index];

                if(user.ordersAll[index].status ==50.toString()){
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
                                      print(user.ordersAll[index].cart[indexs]["name"]);
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
                                                            user.ordersAll[index].cart[indexs]["quantity"].toString()
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
                                  "Payment Mode : Cash",
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

                                Row(
                                  children: [
                                    RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 19.0),
                                      color: Colors.green,
                                      onPressed: (){
                                        appload.changeIsLoading();
                                        orderService.updateOrder(uid: user.ordersAll[index].id,status: user.ordersAll[index].status);
                                        appload.changeIsLoading();
                                      },
                                      child: Text(
                                        "Deliver",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 15.0,),
                                    RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 19.0),
                                      color: Colors.red,
                                      onPressed: (){
                                        appload.changeIsLoading();
                                        //orderService.updateOrder(uid: user.orders[index].id,status: user.orders[index].status);
                                        _showDialog(user.ordersAll[index].id,user.ordersAll[index].status);
                                        appload.changeIsLoading();
                                      },
                                      child: Text(
                                        "Cancel Order",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  );
                }else{
                  return SizedBox();
                }


              }
          ),
        ),
      ),
    );
  }
}
