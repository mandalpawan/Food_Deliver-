import 'package:flutter/material.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:provider/provider.dart';

import 'admin_add_item.dart';
import 'food_api.dart';
import 'food_list_data.dart';

class ShowAdminFoodDetail extends StatefulWidget {
  @override
  _ShowAdminFoodDetailState createState() => _ShowAdminFoodDetailState();
}

class _ShowAdminFoodDetailState extends State<ShowAdminFoodDetail> {
  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context );

    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          foodNotifier.currentFood.title,

        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  foodNotifier.currentFood.image != null ?
                  foodNotifier.currentFood.image : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(foodNotifier.currentFood.title,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                   "Rs "+ foodNotifier.currentFood.price,
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

                Text(
                  foodNotifier.currentFood.sale,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0
                  ),
                ),
            SizedBox(
              height: 15.0,
            ),

            Text(
              "Discription",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 15.0,
            ),

            Text(
              foodNotifier.currentFood.discription,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey
              ),
            ),

          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder:  (BuildContext context){
                    return AddfooditemAdmin(isUpdating: true);
                  }
                  )
              );
            },
            child: Icon(Icons.edit),
            foregroundColor: Colors.white,
          ),

          SizedBox(height: 20.0,),

          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => deleteFood(foodNotifier.currentFood, _onFoodDeleted),
            child: Icon(Icons.delete),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
