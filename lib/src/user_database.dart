import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/user_model.dart';

class DatabaseService{

  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future upDateUserData(String uid,String usertype,String name) async {
    return await userCollection.document(uid).setData(
      {
        'uid' : uid,
        'usertype' :usertype,
        'name' : name,
      }
    );
  }

  // userlist from snapshot
  User _UserlistFromSnapsort(DocumentSnapshot snapshot) {
      return User(
        uid: snapshot.data['uid'] ,
        username: snapshot.data['name'] ,
        usertype: snapshot.data['usertype'] ,
      );
    }


  Stream<User> get UserData {
    return userCollection.document(uid).snapshots()
        .map(_UserlistFromSnapsort);
  }

}