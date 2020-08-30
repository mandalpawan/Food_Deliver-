import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/card_model.dart';

class CardDataServices{

  final String uid;

  CardDataServices({this.uid});

  final CollectionReference cardCollection = Firestore.instance.collection('cards');


  Future upDateCardData(String title,String price,String
  discount, String Catagory,String discription, String image,String FoodId,String quantity,String totalPrice) async {
    return await cardCollection.document(uid).collection('carts').add(
        {
          'id' : null,
          'title' :title,
          'price' : price,
          'discount' :discount,
          'Catagory' : Catagory,
          'discription' : discription,
          'image' : image,
          'quantity' : quantity,
          'FoodId': FoodId,
          'totalPrice': totalPrice,
        }
    );
  }

//userlist from snapshot
  CardModel _CardlistFromSnapsort(DocumentSnapshot snapshot) {
    return CardModel(
      id: snapshot.data['uid'],
      title: snapshot.data['title'],
      price: snapshot.data['price'],
      discount: snapshot.data['discount'],
      image: snapshot.data['image'],
      Catagory: snapshot.data['Catagory'],
      discription: snapshot.data['discription'],
      quantity: snapshot.data['quantity'],
    );
  }

  Stream<QuerySnapshot> get CardData {
    return cardCollection.document(uid).collection('carts').snapshots();
  }
}
