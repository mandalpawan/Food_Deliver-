import 'package:flutter/material.dart';
import 'package:food_delivery/src/sigin_page.dart';

class SinUpPage extends StatefulWidget {
  @override
  _SinUpPageState createState() => _SinUpPageState();
}

class _SinUpPageState extends State<SinUpPage> {
  bool toogleVisibilty = true;
  bool toogleVisibiltycnf = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30.0),


            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          color: Color(0xFF8DC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          color: Color(0xFF8DC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Color(0xFF8DC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0),

                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFF8DC2CB),
                          fontSize: 18.0,
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                toogleVisibilty = !toogleVisibilty;
                              });
                            },
                            icon: toogleVisibilty ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      ),
                      obscureText: toogleVisibilty,
                    ),

                    SizedBox(height: 20.0),

                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Color(0xFF8DC2CB),
                          fontSize: 18.0,
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                toogleVisibiltycnf = !toogleVisibiltycnf;
                              });
                            },
                            icon: toogleVisibiltycnf ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      ),
                      obscureText: toogleVisibiltycnf,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0,),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Divider(height: 20.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "I already have an account",
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SinInPage()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
