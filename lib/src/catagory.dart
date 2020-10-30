import 'package:flutter/material.dart';
import 'package:food_delivery/page/catagory.dart';
import 'package:google_fonts/google_fonts.dart';


class horizontal_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          catagory(
            image_caption: 'Thali',
            image_location: 'assets/images/breakfast.png',
          ),

          catagory(
            image_caption: 'Chinese',
            image_location: 'assets/images/china.jpg',
          ),

          catagory(
            image_caption: 'Refreshment',
            image_location: 'assets/images/refresh.jpg',
          ),

          catagory(
            image_caption: 'Snacks',
            image_location: 'assets/images/snacks.png',
          ),

          catagory(
            image_caption: 'Desserts',
            image_location: 'assets/images/dessrts.png',
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
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,
            width: 100.0,
            height: 75.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  image_caption,
                  style: GoogleFonts.robotoMono(
                    fontSize: 11.0,
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}