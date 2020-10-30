
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/page/loading.dart';
import 'package:food_delivery/provider/app.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/src/food_notifier.dart';

import 'package:provider/provider.dart';

class frequentlyBought extends StatefulWidget {
  @override
  _frequentlyBoughtState createState() => _frequentlyBoughtState();
}

class _frequentlyBoughtState extends State<frequentlyBought> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  int quantity = 1;
  int totalPrice = 0;

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
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        title: Text(
            foodNotifier.currentFood.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.orangeAccent,
                    size: 40.0,
                  ),
                  onPressed: (){
                    setState(() {
                      if(quantity>1 ){
                        quantity -= 1;
                        totalPrice = quantity * int.parse(foodNotifier.currentFood.price);
                      }
                    });
                  },
                ),

                SizedBox(width: 15.0,),

                Text(
                  quantity.toString(),
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(width: 15.0,),

                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.orangeAccent,
                    size: 40.0,
                  ),
                  onPressed: (){
                    setState(() {
                      if(quantity<10){
                        quantity += 1;
                        totalPrice = quantity * int.parse(foodNotifier.currentFood.price);
                      }
                    });

                  },
                ),
              ],
            ),

            SizedBox(height: 20.0,),
            FlatButton(
              color: Colors.orangeAccent,
              child: RaisedButton(
                color: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 23.0,vertical: 10.0),
                onPressed: () async {
                  app.changeIsLoading();
                  bool value =  await user.addToCart(product: foodNotifier.currentFood,quantity: quantity.toString());
                  if(value){
                    print("Item added to cart");
                    _scaffoldkey.currentState.showSnackBar(
                        SnackBar(content: Text("Added ro Cart!"))
                    );
                    user.reloadUserModel();
                    app.changeIsLoading();
                    Navigator.of(context).pop();
                    return;
                  } else{
                    print("Item NOT added to cart");

                  }
                },
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
                height: 200.0,
                color: Colors.orangeAccent,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5.0,
                      right: 110.0,
                      child: CircleAvatar(
                        maxRadius: (70.0),
                        backgroundImage: NetworkImage(
                           foodNotifier.currentFood.image == null ?'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg' :
                           foodNotifier.currentFood.image
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
              foodNotifier.currentFood.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
             foodNotifier.currentFood.Catagory,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
              "\u20B9 "+ foodNotifier.currentFood.price,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
              ),
            ),

            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                foodNotifier.currentFood.discription,
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




















