import 'package:flutter/material.dart';
import 'package:food_delivery/src/service_auth.dart';
import 'package:food_delivery/src/sigin_page.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text("Sign Up"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder:  (BuildContext context){
                        return SigIn();
                      }
                      )
                  );
                },
                icon: Icon(Icons.person),
                label: Text('Sign In')
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (val) => val.isEmpty ? "Enter an Email" : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (val) => val.length<6 ? "Enter the password at 6 charater" : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.blueAccent[400],
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: ()  async {
                    if(_formKey.currentState.validate()) {
                     dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                     if(result == null){
                       setState(() => error = "Invalid Email or Password");
                     }
                    }
                  },
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
