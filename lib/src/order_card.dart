import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75.0,
              width: 40.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0,color: Color(0xFFD3D3D3)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: (){},
                    child: Icon(Icons.keyboard_arrow_up,color: Color(0xFFD3D3D3),),
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Icon(Icons.keyboard_arrow_down,color: Color(0xFFD3D3D3),),
                  ),
                ],
              ),
            ),

            SizedBox(width: 20.0,),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Cakes/cake2.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(5.0,5.0)
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Sweet Cake",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.0,),
                Text("\$10.0",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.cancel,color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }
}
