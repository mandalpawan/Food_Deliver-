import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:provider/provider.dart';

import 'admin_view_food_item.dart';
import 'food_detail.dart';
import 'food_notifier.dart';

class AdminFoodDetailScreen extends StatefulWidget {
  @override
  _AdminFoodDetailScreenState createState() => _AdminFoodDetailScreenState();
}

class _AdminFoodDetailScreenState extends State<AdminFoodDetailScreen> {


  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(foodNotifier.foodList.length.toString()),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: Image.network(
                foodNotifier.foodList[index].image != null ?
                   foodNotifier.foodList[index].image : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text(foodNotifier.foodList[index].title),
              subtitle: Text(foodNotifier.foodList[index].title),
              onTap: (){
                foodNotifier.currentFood = foodNotifier.foodList[index];

                Navigator.of(context).push(MaterialPageRoute
                  (builder:  (BuildContext context)=>ShowAdminFoodDetail())
                );
              },
            );
          },

          separatorBuilder: (BuildContext context,int index){
            return Divider(
              height: 0.0,
            );
          },
          itemCount: foodNotifier.foodList.length,
        ),
      ),
    );
  }
}
