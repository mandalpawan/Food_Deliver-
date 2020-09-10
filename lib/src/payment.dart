import 'package:flutter/material.dart';
import 'package:food_delivery/model/cartitem.dart';
import 'package:food_delivery/page/order_succes.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/services/order.dart';
import 'package:food_delivery/src/paymentgateway.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Payment Method"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/Illu/payment.png',
                      width: 260.0,height: 150.0,
                      fit: BoxFit.cover,
                    )),
              ),
              Card(
                margin: EdgeInsets.only(top: 15.0),
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0,),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_balance_wallet,
                            ),
                            SizedBox(width: 15.0,),
                            Text(
                              "Wallet / UPI",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 10.0,color: Colors.grey,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context){
                                  return payment();
                                }
                            ));
                          },


                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                              ),
                              SizedBox(width: 15.0,),
                              Text(
                                "Credit / Debit Card",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 10.0,color: Colors.grey,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {

                            app.changeIsLoading();

                            var uuid = Uuid();
                            String id = uuid.v4();
                            _orderServices.createOrder(
                                userId: user.user.uid,
                                id: id,
                                description: "Some random description",
                                status: "complete",
                                totalPrice: user.userModel.totalCartPrice,
                                cart: user.userModel.cart
                            );
                            for(CartItemModel cartItem in user.userModel.cart){
                              bool value = await user.removeFromCart(cartItem: cartItem);
                              if(value){
                                user.reloadUserModel();
                                print("Item added to cart");
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Removed from Cart!"))
                                );
                              }else{
                                print("ITEM WAS NOT REMOVED");
                              }
                            }
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("Order created!"))
                            );
                            app.changeIsLoading();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context){
                                  return OrderSuccess();
                                }
                            ));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.directions_run,
                                ),
                                SizedBox(width: 15.0,),
                                Text(
                                  "Cash On Delivery",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
