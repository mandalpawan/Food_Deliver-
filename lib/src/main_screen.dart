import 'package:flutter/material.dart';
import 'package:food_delivery/provider/user.dart';
import 'package:food_delivery/src/final_order_page.dart';
import 'package:food_delivery/src/order_page.dart';
import 'package:provider/provider.dart';

//Pages importing
import 'homepage.dart';
import 'order_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';

class Main_screen extends StatefulWidget {
  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  Order order;
  Favorate favorite;
  Profile profile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage();
    order = Order();
    favorite = Favorate();
    profile = Profile();

    pages = [homePage,favorite,order,profile];

    currentPage = homePage;

  }


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme:  IconThemeData(color: Colors.black),
          title: Text("Pleasant Food",
            style: TextStyle(
              color: Colors.black,
          ),
          ),
          actions: <Widget>[

            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).primaryColor,
              ),
            ),

            IconButton(
              onPressed: () async {
                await user.getOrders();
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                   return OrderFinal();
                  }
                ));
              },
              icon: _buildShoppingCart(),
            ),

          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //Header
              UserAccountsDrawerHeader(
                accountName: Text(user.userModel.name.toUpperCase()),
                accountEmail: Text(user.userModel.email.toUpperCase()),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              //Body
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home Page"),
                  leading: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Acccount"),
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Order"),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.blue,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {},
                      ));
                },
                child: ListTile(
                  onTap: (){},
                  title: Text(
                    "Shopping Cart",
                  ),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.blue,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    "Favourites",
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Setting"),
                  leading: Icon(Icons.settings),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Help"),
                  leading: Icon(Icons.help),
                ),
              )
            ],
          ),
        ),


        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        ),

        body: currentPage,
      ),
    );
  }

    Widget _buildShoppingCart(){

      final user = Provider.of<UserProvider>(context);

     return Stack(
       children: <Widget>[
         Icon(Icons.shopping_basket,
           color: Theme.of(context).primaryColor,
         ),
         /*
         Positioned(
           top: 0.0,
           right: 0.0,
           child: Container(
             height: 12.0,
             width: 12.0,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6.0),
               color: Colors.red,
             ),
             child: Center(
               child: Text(user.orders.length.toString(),
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 12.0,
               ),
               ),
             ),
           ),
         ),
         */
       ],
     );
    }
}
