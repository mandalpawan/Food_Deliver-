
import 'package:flutter/material.dart';
import 'package:food_delivery/page/loading.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/services/order.dart';
import 'package:provider/provider.dart';

class trackOrderPage extends StatefulWidget {
  final status;
  final id;
  trackOrderPage(this.status,this.id);
  @override
  _trackOrderPageState createState() => _trackOrderPageState();
}

class _trackOrderPageState extends State<trackOrderPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context,listen: false);
    final app = Provider.of<AppProvider>(context,listen: false);
    OrderServices orderService =  OrderServices();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Track Order", style: TextStyle(
            color: Colors.black
        ),),

      ),
      body:app.isLoading ? Loading() : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Order Number:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(widget.id.toString(), ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13, top: 50),
                    width: 4,
                    height: 400,
                    color: Colors.grey,
                  ),

                  (widget.status!="-100") ? Column(
                      children: [
                        (widget.status=="0") ? statusWidget( 'Confirmed', true)  : statusWidget( 'Confirmed', false),
                        (widget.status=="25") ? statusWidget( "Picked Up", true): statusWidget( "Picked Up", false),
                        (widget.status=="50") ? statusWidget( "In Process", true):statusWidget( "In Process", false),
                        (widget.status=="75") ? statusWidget( "Shipped", true):statusWidget( "Shipped", false),
                        (widget.status=="100") ? statusWidget( "Delivered", true):statusWidget( "Delivered", false),
                      ]
                  ):Column(
                      children: [
                        statusWidget( 'Confirmed', true),
                        statusWidget("Cancelled", true),
                        statusWidget( "Cancelled", true),
                        statusWidget( "Cancelled", true),
                        statusWidget( "Cancelled", true),
                      ]
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),

              (widget.status !="-100") && (widget.status !="100") ?  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      app.changeIsLoading() ;
                      orderService.CancelOrder(uid: widget.id,status: widget.status);
                      print(widget.status);
                      user.reloadUserModel();
                      app.changeIsLoading();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.orangeAccent,
                          )
                      ),
                      child: Text(
                        "Cancel Order",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orangeAccent,
                      ),
                      child: Text(
                          "My Orders",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ):Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                     // changeScreen(context, myorders());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orangeAccent,
                      ),
                      child: Text("My Orders",),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
  Container statusWidget( String status, bool isActive)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Colors.orangeAccent : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Colors.orangeAccent,
                    width: 3
                )
            ),
          ),
          SizedBox(width: 50,),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                ),
              ),
              Text(status, )
            ],
          )
        ],
      ),
    );
  }
}

