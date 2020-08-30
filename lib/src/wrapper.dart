import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/admin_deshboard.dart';
import 'package:food_delivery/src/main_screen.dart';
import 'package:food_delivery/src/sigin_page.dart';
import 'package:food_delivery/src/user_database.dart';
import 'package:food_delivery/src/user_model.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    if(user == null){
      return SigIn();
    } else{
      Firestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .getDocuments()
          .then((docs) {
        if (docs   .documents[0].exists) {
          if (docs.documents[0].data['usertype'] == 'admin') {
            //print( 'admin');
          } else {
           // print( 'user');
          }
        }
      });

      return Main_screen();

    }
  }
}
