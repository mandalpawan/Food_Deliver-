

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/model/cartitem.dart';
import 'package:food_delivery/model/order.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId ,String id,String description,String status ,List<CartItemModel> cart, int totalPrice,String name,String mobile,String table}) {
    List<Map> convertedCart = [];

    for(CartItemModel item in cart){
      convertedCart.add(item.toMap());
    }


    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now(),
      "description": description,
      "status": status,
      'name':name,
      'mobile':mobile,
      'table': table
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });

  void  updateOrder({ String uid ,String  status }) async =>
      _firestore.collection(collection)
          .document(uid)
          .updateData({'status': (int.parse(status) + 50).toString() });

  void  CancelOrder({ String uid ,String  status }) async =>
      _firestore.collection(collection)
          .document(uid)
          .updateData({'status': (int.parse(status) - 100).toString() });

}