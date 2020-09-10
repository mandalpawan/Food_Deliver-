import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/cartitem.dart';
import 'package:food_delivery/model/product.dart';
import 'package:food_delivery/model/user.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  void createUser(Map<String , dynamic> values) {
    _firestore.collection(collection).document(values["uid"]).setData(values);
  }

  Future<UserModel> getUserById(String id)=> _firestore.collection(collection).document(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });

  void addToCart({String userId, CartItemModel cartItem}){
      _firestore.collection(collection).document(userId).updateData({
        "cart": FieldValue.arrayUnion([cartItem.toMap()])
      });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}