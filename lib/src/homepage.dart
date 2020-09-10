import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/page/all_page.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:provider/provider.dart';
import 'catagory.dart';
import 'serch_box.dart';
import 'food_list.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    print(user.userModel.userType);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0,right: 20.0),
        children: <Widget>[

          //========Top Most Part ==========================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  Text("What would",
                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w800),
                  ),
                  Text("you like to eat?",
                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w800),
                  ),
                ],
              ),

                ],
          ),


          //Horizontal List of Item
          horizontal_list(),
          SizedBox(height: 20.0,),
          //Serch Menu
          SerchBox(),

          //Start  food box
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequently Bought Food",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context){
                      return AllItem();
                    }
                  ));
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              )
            ],
          ),

          //Frenently Bough Item List
          SizedBox(height: 20.0,),

          Bought_item(),


        ],
      ),
    );
  }



}