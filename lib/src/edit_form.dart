import 'package:flutter/material.dart';
import 'package:food_delivery/src/loding_page.dart';
import 'package:food_delivery/src/user_database.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:provider/provider.dart';

class editForm extends StatefulWidget {
  @override
  _editFormState createState() => _editFormState();
}

class _editFormState extends State<editForm> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<User>(
      stream: DatabaseService(uid: user.uid).UserData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userdata = snapshot.data;
          return Form(
            child: TextFormField(
              initialValue: userdata.username,
            ),
          );

        }else{
          return Loading();
        }
      }
    );
  }
}
