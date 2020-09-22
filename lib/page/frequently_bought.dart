
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/page/loading.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:food_delivery/src/food_notifier.dart';

import 'package:provider/provider.dart';

class frequentlyBought extends StatefulWidget {
  @override
  _frequentlyBoughtState createState() => _frequentlyBoughtState();
}

class _frequentlyBoughtState extends State<frequentlyBought> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  _showSnackbar(){
    print("Item Added to Cart");
    final snackBar = new SnackBar(content: new Text("Item added to cart"),
      duration: new Duration(seconds: 3),
      backgroundColor: Colors.green,
    );
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);


    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        elevation: 0.0,
        //title: CustomText(text: "Product Details"),
      ),
      bottomNavigationBar: Container(
        height: 250.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: (){
                    //sub();
                  },
                  child: Icon(Icons.remove,color:Colors.white,size: 40.0,),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.green,
                ),
                Text(
                  "250",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RawMaterialButton(
                  onPressed: (){
                   // add();
                  },
                  child: Icon(Icons.add,color:Colors.white,size: 40.0,),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              onPressed: () {
               // Navigator.of(context).push(new MaterialPageRoute
                 // (builder: (context)=>new Order(
                //  prod_name: widget.name,prod_images: widget.image,prod_price:widget.price,
                //  prod_qty: _valu,total: (int.parse(widget.price))*_valu,id: widget.productId,stock: widget.stock,
               // ))
               // );
              },
              child: Text(
                "Buy Now ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            FlatButton(
              color: Colors.orangeAccent,
              child: RaisedButton(
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 23.0,vertical: 10.0),
                onPressed: () {},
               // async{
                  //app.changeIsLoading();
                 // user.addToCard(widget.name,widget.price,widget.image,widget.productId,_valu,widget.stock);
                 // user.reloadUserModel();
                //  app.changeIsLoading();
                 // _showSnackbar();
               // },
                child:app.isLoading ?Loading() : Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(120),bottomRight: Radius.circular(120)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                color: Colors.green,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5.0,
                      right: 110.0,
                      child: CircleAvatar(
                        maxRadius: (70.0),
                        backgroundImage: NetworkImage('https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
              "Hello",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
             "Hii",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\u20B9 250",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey
                  ),
                ),
                SizedBox(width: 0.0,),
                Text(
                  "250",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                "Hero",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




















