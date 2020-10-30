import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:food_delivery/src/food_detal_Bottom.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:provider/provider.dart';


class CatagoryItem extends StatefulWidget {
  String CatagoryType;

  CatagoryItem({this.CatagoryType});

  @override
  _CatagoryItemState createState() => _CatagoryItemState();
}

class _CatagoryItemState extends State<CatagoryItem> {
  @override

  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context,listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  void showfoodDetail(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
        child: foodDetail(),
      );
    });
  }

  //String imageCaption
  Widget build(BuildContext context) {
    print(widget.CatagoryType);

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(widget.CatagoryType),
      ),
      body:ListView.separated(
        itemBuilder: (BuildContext context,int index){
          if(foodNotifier.foodList[index].Catagory == widget.CatagoryType){
            print(foodNotifier.foodList[index].title);
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  // foodNotifier.currentFood = foodNotifier.foodList[index];
                  // Navigator.of(context).push(
                  //    MaterialPageRoute(builder:  (BuildContext context){
                  //    return FoodDetail();
                  //   }
                  //   )
                  //  );
                },
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 80.0,
                              width: 80.0,
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
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
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

                              SizedBox(height: 10.0,),

                              Text(
                                foodNotifier.foodList[index].Catagory,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),

                            ],
                          ),

                          Spacer(),

                          Column(
                            children: [
                              SizedBox(height: 20.0,),
                              RaisedButton(
                                color: Colors.orangeAccent,
                                onPressed: (){
                                  showfoodDetail();
                                  foodNotifier.currentFood = foodNotifier.foodList[index];
                                },
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ]
                    ),
                  ],
                ),
              ),
            );
          }else{
            return SizedBox();
          }
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
