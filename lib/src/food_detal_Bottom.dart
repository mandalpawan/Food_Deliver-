import 'package:flutter/material.dart';
import 'package:food_delivery/src/card_database.dart';
import 'package:food_delivery/src/card_model.dart';
import 'package:food_delivery/src/cart_notifier.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:provider/provider.dart';


class foodDetail extends StatefulWidget {
  @override
  _foodDetailState createState() => _foodDetailState();
}

class _foodDetailState extends State<foodDetail> {

  int quantity = 1;
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    final user = Provider.of<User>(context);

    _onFoodUploaded(CardModel cart) {
      CartNotifier cartNotifier = Provider.of<CartNotifier>(context, listen: false);
      cartNotifier.addCardModel(cart);
      Navigator.pop(context);
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                      Icons.remove_circle,
                    color: Colors.orangeAccent,
                    size: 30.0,
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
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(width: 15.0,),

                IconButton(
                  icon: Icon(
                      Icons.add_circle,
                    color: Colors.orangeAccent,
                    size: 30.0,
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

            RaisedButton(
              color: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 40.0),
              onPressed: (){
                CardDataServices(uid: user.uid).upDateCardData(
                    foodNotifier.currentFood.title,
                    foodNotifier.currentFood.price,
                    foodNotifier.currentFood.discount,
                    foodNotifier.currentFood.Catagory,
                    foodNotifier.currentFood.discription,
                    foodNotifier.currentFood.image,
                    foodNotifier.currentFood.id,
                    quantity.toString(),
                  totalPrice.toString(),
                );
                Navigator.of(context).pop();
              },
              child: totalPrice == 0 ?
              Text(
                  "Add Cart \n"+ "\u20B9 " +  foodNotifier.currentFood.price,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                ),
              ):
              Text(
                "Add Cart \n"+ "\u20B9 " +  totalPrice.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                        Icons.clear,
                      size: 30,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    foodNotifier.currentFood.image != null ?
                    foodNotifier.currentFood.image : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 15.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    foodNotifier.currentFood.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),

                  Text(
                    "\u20B9 "+ foodNotifier.currentFood.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.orangeAccent
                    ),
                  ),
                ],
              ),

              Text(
                 foodNotifier.currentFood.discription,
                style: TextStyle(
                    fontSize: 18.0,
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }
}
