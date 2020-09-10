import 'package:flutter/material.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:provider/provider.dart';

class Bought_item extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String catagory;
  final double price;
  final double discount;
  final double rating;

  Bought_item({this.id,this.name,this.imagePath,this.catagory,this.price,this.discount,this.rating});
  @override
  _Bought_itemState createState() => _Bought_itemState();
}

class _Bought_itemState extends State<Bought_item> {
  @override

  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context,listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  Widget build(BuildContext context) {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context,int index){
      if(foodNotifier.foodList[index].sale == "OnSale"){
        return GestureDetector(
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: 350.0,
                    child: Image.network(
                      foodNotifier.foodList[index].image != null ?
                      foodNotifier.foodList[index].image : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: 60.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,Colors.black54,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.bottomCenter,
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    right: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              foodNotifier.foodList[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                                Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                                Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                                Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                                Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                                SizedBox(width: 20.0,),
                                Text(
                                  ("120  Reviews"),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "Rs. " + foodNotifier.foodList[index].price,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    );
  }
}
