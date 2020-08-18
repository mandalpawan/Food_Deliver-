import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_notifier.dart';


class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Food Deatils",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                SizedBox(height: 20.0,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          foodNotifier.currentFood.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "\u20B9 "+ foodNotifier.currentFood.price,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 20.0,),

                Text(
                    "Discription",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15.0,),

                Text(
                  foodNotifier.currentFood.discription+"is simply dummy text of the printing and "
                      "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                      "text ever since the 1500s, when an unknown printer took a galley of type"
                      " and scrambled it to make a type specimen book. It has survived not only "
                      "five centuries, but also the leap into electronic typesetting, remaining"
                      " essentially unchanged. It was popularised in the 1960s with the release of",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5
                  ),
                ),

                SizedBox(height: 20.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: (){},
                    ),

                    SizedBox(width: 15.0,),

                    Text(
                        "1",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(width: 15.0,),

                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: (){},
                    ),
                  ],
                ),

                SizedBox(height: 20.0,),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
