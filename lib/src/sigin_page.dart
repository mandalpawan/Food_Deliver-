import 'package:flutter/material.dart';
import 'package:food_delivery/src/loding_page.dart';
import 'package:food_delivery/src/service_auth.dart';
import 'package:food_delivery/src/singup_page.dart';

class SigIn extends StatefulWidget {
  @override
  _SigInState createState() => _SigInState();
}

class _SigInState extends State<SigIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): SafeArea(
        child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text("Sigin"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder:  (BuildContext context){
                        return Register();
                      }
                      )
                  );
                },
                icon: Icon(Icons.person),
                label: Text('Register')
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
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                    onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'Could not sign in with those credentials';
                            loading = false;
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
