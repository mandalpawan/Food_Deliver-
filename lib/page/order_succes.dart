import 'package:flutter/material.dart';
import 'package:food_delivery/src/main_screen.dart';


class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thanks to Ordered \n Welcome Again",
              style: TextStyle(
                fontSize: 25.0,

              ),
            ),

            SizedBox(height: 30.0,),
            Text(
              "Your Order Success",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 20.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                  color: Colors.blueAccent,
                  child: Icon(
                      Icons.check,color: Colors.white,
                  )
              ),
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return Main_screen();
                  }
                ));
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
