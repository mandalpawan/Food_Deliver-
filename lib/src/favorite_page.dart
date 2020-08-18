import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:provider/provider.dart';

import 'food_detail.dart';
import 'food_notifier.dart';

class Favorate extends StatefulWidget {
  @override
  _FavorateState createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {


  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context,listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white,
        body: ListView.separated(
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  foodNotifier.currentFood = foodNotifier.foodList[index];
                  Navigator.of(context).push(
                      MaterialPageRoute(builder:  (BuildContext context){
                        return FoodDetail();
                      }
                      )
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                       child: Image.network(
                          foodNotifier.foodList[index].image != null ?
                          foodNotifier.foodList[index].image : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            foodNotifier.foodList[index].title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                            foodNotifier.foodList[index].Catagory,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "\u20B9 "+foodNotifier.foodList[index].price,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),

                  ]
                ),
              ),
            );
          },

          separatorBuilder: (BuildContext context,int index){
            return Divider(
              height: 0.0,
            );
          },
          itemCount: foodNotifier.foodList.length,
        ),
    );
  }
}
