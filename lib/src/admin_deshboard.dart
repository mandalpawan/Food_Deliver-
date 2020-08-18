import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_add_item.dart';
import 'admin_food_detail_screen.dart';
import 'admin_view_food_item.dart';
import 'food_notifier.dart';


class AdminDeshBoard extends StatefulWidget {
  @override
  _AdminDeshBoardState createState() => _AdminDeshBoardState();
}

class _AdminDeshBoardState extends State<AdminDeshBoard> {

  @override
  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Deshboard",
        ),
      ),
      drawer: Drawer(
      child: ListView(
        children: <Widget>[

          InkWell(
            onTap: () {
              foodNotifier.currentFood = null;
              foodNotifier.currentFood = null;
              Navigator.of(context).push(
                  MaterialPageRoute(builder:  (BuildContext context){
                    return AddfooditemAdmin(isUpdating: false);
                  }
                  )
              );
            },
            child: ListTile(
              title: Text("Add Food Item"),
              leading: Icon(
                Icons.add,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder:  (BuildContext context){
                    return AdminFoodDetailScreen();
                  }
                  )
              );
            },
            child: ListTile(
              title: Text("View Food Item"),
              leading: Icon(
                Icons.view_agenda,
              ),
            ),
          ),

        ],
      ),
      ),

      body: Center(
        child: Text("Desh Board",style: TextStyle(fontSize: 35.0),),
      ),
    );
  }
}
