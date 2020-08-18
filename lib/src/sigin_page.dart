import 'package:flutter/material.dart';

import 'singup_page.dart';

class SinInPage extends StatefulWidget {
  @override
  _SinInPageState createState() => _SinInPageState();
}

class _SinInPageState extends State<SinInPage> {
  bool toogleVisibilty = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Sign In",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 90.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                    "Forget Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0),

            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Your email or username",
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
                  "Don't have an account?",
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SinUpPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0,),

            _signInButton(),

          ],
        ),
      ),
    );
  }

      Widget _signInButton() {
        return OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("assets/images/google_logo.png"), height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
}
