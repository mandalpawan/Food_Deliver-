import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/model/cartitem.dart';
import 'package:food_delivery/page/order_succes.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/services/order.dart';
import 'package:food_delivery/src/paymentgateway.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class Payment extends StatefulWidget {
  String Name;
  String mobile;
  String table_no;

  Payment({this.Name,this.mobile,this.table_no});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int totalamount = 0;
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }
  void openCheckout()async{
    var option = {
      'key':'rzp_test_5kXTZFKFenELgf',
      'amount':totalamount*100,
      'name':'Dartings',
      'description':'Test Payment',
      'prefill':{'contact':'','email':''},
      'external':{
        'wallets':['paytm']
      }
    };
    try{
      _razorpay.open(option);
    }catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg:"SUCCESS"+ response.paymentId);
  }
  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg:"ERROR"+ response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Toast"+ response.walletName);
  }

  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    setState(() {
      totalamount=user.userModel.totalCartPrice;
    });
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
                        child: InkWell(
                          onTap: (){
                            openCheckout();
                          },

                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                              ),
                              SizedBox(width: 15.0,),
                              Text(
                                "Online Payment",
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
                                status: "0",
                                totalPrice: user.userModel.totalCartPrice,
                                cart: user.userModel.cart,
                                name: widget.Name,
                                mobile: widget.mobile,
                                table: widget.table_no
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

                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);


                           /* Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context){
                                  return OrderSuccess();
                                }
                            ));*/
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
