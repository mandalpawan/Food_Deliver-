import 'package:flutter/material.dart';
import 'package:food_delivery/adminPage/orders.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/src/food_api.dart';
import 'package:provider/provider.dart';
import 'admin_add_item.dart';
import 'admin_food_detail_screen.dart';
import 'food_notifier.dart';


enum Page { dashboard, manage }

class AdminDeshBoard extends StatefulWidget {
  @override
  _AdminDeshBoardState createState() => _AdminDeshBoardState();
}

class _AdminDeshBoardState extends State<AdminDeshBoard> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.orange;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();

  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard'))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                        _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    final user = Provider.of<UserProvider>(context);

    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                    "\u20B9 \t"+user.totalSale.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0, color: Colors.green
                  ),
                ),
              ),
              /*
              FlatButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text(user.totalSale.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),*/
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){},
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
                          subtitle: Text(
                            user.allUser.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context){
                                    return AdminFoodDetailScreen();
                                  }
                                ));
                              },
                              icon: Icon(Icons.track_changes),
                              label: Text("Producs")),
                          subtitle: Text(
                            foodNotifier.foodList.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context){
                                      return OrderItem();
                                    }
                                ));
                              },
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Orders")),
                          subtitle: Text(
                            user.totalOrderedItem.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){},
                              icon: Icon(Icons.category),
                              label: Text("Process")),
                          subtitle: Text(
                            user.totalprocessingItem.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){},
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Text(
                            user.totalSoldItem.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: (){},
                              icon: Icon(Icons.close),
                              label: Text("Return")),
                          subtitle: Text(
                            user.totalCancelItem.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add product"),
              onTap: () {
                foodNotifier.currentFood = null;
                foodNotifier.currentFood = null;
                Navigator.of(context).push(
                    MaterialPageRoute(builder:  (BuildContext context){
                      return AddfooditemAdmin(isUpdating: false);
                    }
                    )
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder:  (BuildContext context){
                      return AdminFoodDetailScreen();
                    }
                    )
                );
              },
            ),
            Divider(),
            GestureDetector(
              onTap: () async {
                user.signOut();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 25.0),
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
        break;
      default:
        return Container();
    }
  }


}
