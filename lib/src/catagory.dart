import 'package:flutter/material.dart';
import 'package:food_delivery/page/catagory.dart';

class horizontal_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          catagory(
            image_caption: 'Burger',
            image_location: 'assets/images/Burger/burger_logo.png',
          ),

          catagory(
            image_caption: 'Cakes',
            image_location: 'assets/images/Cakes/cake_logo.png',
          ),

          catagory(
            image_caption: 'Chanies',
            image_location: 'assets/images/Chanies/chines_logo.png',
          ),

          catagory(
            image_caption: 'Fast Food',
            image_location: 'assets/images/Fast_food/fast_food_logo.png',
          ),

          catagory(
            image_caption: 'IceCream',
            image_location: 'assets/images/Ice_cream/ice_cream_logo.png',
          ),

          catagory(
            image_caption: 'Pizza',
            image_location: 'assets/images/Pizza/pizza_logo.png',
          ),

          catagory(
            image_caption: 'South',
            image_location: 'assets/images/South_Indian/south_indian_logo.png',
          ),
        ],
      ),
    );
  }
}

class catagory extends StatelessWidget {
  final String image_location;
  final String image_caption;

  catagory({
    this.image_caption,
    this.image_location,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context){
              return CatagoryItem(CatagoryType: image_caption,);
            }
          ));
        },
        child: Container(
          width: 85.0,
          child: ListTile(
            title: Image.asset(image_location,
            width: 100.0,
            height: 80.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption
              ),
            ),
          ),
        ),
      ),
    );
  }
}