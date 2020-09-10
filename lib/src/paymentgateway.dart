import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
class payment extends StatefulWidget {
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
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
      'key':'rzp_test_OjMIawXolRgDGr',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:Text( "Payment"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
              maxWidth: 150.0,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Your Amount Please'
                  ),
                  onChanged: (value) {
                    setState(() {
                      totalamount = num.parse(value);
                    });
                  }

              ),
            ),
            SizedBox(
              height: 15.0,

            ),
            RaisedButton(
              color: Colors.teal,
              child: Text("Make Payement",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),), onPressed: () {
              openCheckout();
            },
            )
          ],
        ),
      ),
    );
  }
}
