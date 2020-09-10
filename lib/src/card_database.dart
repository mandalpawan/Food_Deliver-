import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/card_model.dart';
import 'package:uuid/uuid.dart';

Firestore _firestore = Firestore.instance;

void addToCart({String userId,String title,String price,String discount,String catagory,String discription,
  String imageurl,String quantity,String foodId,String totalPrice}){

  var uuid = Uuid();
  String cartItemId = uuid.v4();

  print("THE USER ID IS: $userId");


  _firestore.collection('Carts').document(userId).collection('carts').document(cartItemId).setData(
    {
      'id' : cartItemId,
      'title' : title,
      'price' : price,
      "discount" :discount,
      "Catagory" : catagory,
      "discription": discription,
      "image" : imageurl,
      "quantity" : quantity,
      "FoodId" : foodId,
      "totalPrice": totalPrice,

    }
  );

}

Future<CardModel> getCartItem(String id) => _firestore.collection('Carts').document(id).collection('carts').document().get().then((doc){
  return CardModel.fromSnapshot(doc);
});