import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/adminPage/loading_page_admin.dart';
import 'package:food_delivery/src/food_list_data.dart';
import 'package:food_delivery/src/food_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'food_api.dart';

class AddfooditemAdmin extends StatefulWidget {

  final bool isUpdating;

  AddfooditemAdmin({@required this.isUpdating});

  @override
  _AddfooditemAdminState createState() => _AddfooditemAdminState();
}

class _AddfooditemAdminState extends State<AddfooditemAdmin> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Food _currentFood;
  String _imageUrl;
  File _imageFile;

  var _FoodListCatagory = ["Thali", "Chinese","Refreshment","Snacks","Desserts"];

  var _FoodListSale = ["OnSale", "Not Sale"];

  var _currentFoodCatagoryList = "Thali";
  var _currentFoodSaleList = "Not Sale" ;

  @override
  void initState(){
    super.initState();
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context , listen: false);

    if(foodNotifier.currentFood != null){
      _currentFood = foodNotifier.currentFood;
    }else{
      _currentFood = Food();
    }
    _imageUrl = _currentFood.image;

  }


  Widget _showImage(){
    if (_imageFile == null && _imageUrl == null) {
      return SizedBox();
      print("No image found");

    } else if(_imageFile != null){
      print("Showing Image from file");

      return Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250.0,
          ),
          FlatButton(
            child: Text(
              "Change Image",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onPressed: ()=> _getLocalImage(),
          ),
        ],
      );

    }else if(_imageUrl!= null){
      print("Showing Image from url");

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(_imageUrl,
            fit: BoxFit.cover,
            height: 250.0,
          ),
          FlatButton(
            padding: EdgeInsets.all(16.0),
            color: Colors.black54,
            child: Text(
              "Change Image",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0),
            ),
            onPressed: ()=> _getLocalImage(),
          ),
        ],
      );
    }
  }

  _getLocalImage() async{
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 400,
    );
    if(imageFile != null){
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  _onFoodUploaded(Food food) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    foodNotifier.addFood(food);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  Widget _buildNameField(){
    return TextFormField(
      initialValue: _currentFood.title,
      decoration: InputDecoration(labelText: "Name"),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 18.0),
      validator: (String value){
        if(value.isEmpty){
          return "Name field is required";
        }
        if(value.length<3 || value.length>20){
          return "Name must be less then 3 and less the 20";
        }
        return null;
      },
      onSaved: (String value){
        _currentFood.title = value;
      },
    );
  }

  Widget _buildOnSaleField(){
    return Container(
      child: DropdownButtonFormField<String>(
        items: _FoodListSale.map((String dropDownItem){
          return DropdownMenuItem<String>(
            value: dropDownItem,
            child: Text(dropDownItem),
          );
        }).toList(),
        decoration: InputDecoration(labelText: "OnSale",),
        onChanged: (String value) {
          setState(() {
            _currentFoodSaleList = value;
          });
        },
        value: _currentFoodSaleList,
        onSaved: (String value){
          _currentFood.sale =value;
        },
      ),
    );

  }

  Widget _buildCatagoryField(){
    return Container(
      child: DropdownButtonFormField<String>(
        items: _FoodListCatagory.map((String dropDownItem){
          return DropdownMenuItem<String>(
            value: dropDownItem,
            child: Text(dropDownItem),
          );
        }).toList(),
        decoration: InputDecoration(labelText: "Catagory",),

        onChanged: (String value) {
          setState(() {
            _currentFoodCatagoryList = value;
          });
        },
        validator: (String value){

        },
        value: _currentFoodCatagoryList,
        onSaved: (String value){
          _currentFood.Catagory =value;
        },
      ),
    );

  }

  Widget _buildDiscriptionField(){
    return TextFormField(
      initialValue: _currentFood.discription,
      maxLines: 5,
      decoration: InputDecoration(labelText: "Discription",),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 18.0),
      validator: (String value){
        if(value.isEmpty){
          return "Discription field is required";
        }
        if(value.length<3 || value.length>200){
          return "Discription must be less then 3 and less the 20";
        }
        return null;
      },
      onSaved: (String value){
        _currentFood.discription = value;
      },
    );
  }

  Widget _buildPriceField(){
    return TextFormField(
      initialValue: _currentFood.price,
      decoration: InputDecoration(labelText: "Price"),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 18.0),
      validator: (String value){
        if(value.isEmpty){
          return "Price field is required";
        }
        if(value.length>3){
          return "";
        }
        return null;
      },
      onSaved: (String value){
        _currentFood.price = value;
      },
    );
  }

  Widget _buildDiscountField(){
    return TextFormField(
      initialValue: _currentFood.discount,
      decoration: InputDecoration(labelText: "Discount"),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 18.0),
      validator: (String value){
        if(value.isEmpty){
          return "Discount field is required";
        }
        if(value.length>3){
          return "";
        }
        return null;
      },
      onSaved: (String value){
        _currentFood.discount = value;
      },
    );
  }


  _saveFood(){
    if(!_formkey.currentState.validate()){
      return;
    }
    _formkey.currentState.save();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return LoadingPage();
        }
    ));

    uploadFoodAndImage(_currentFood, widget.isUpdating , _imageFile,_onFoodUploaded);


    //print("name: ${_currentFood.title}");
   // print("CatagoryDrop: ${_currentFood.Catagory}");
    //print("CatagoryDropsale: ${_currentFood.sale}");
   // print("Catagory: ${_currentFood.discription}");
   // print("Catagory: ${_currentFood.price}");
   // print("Catagory: ${_currentFood.discount}");
   // print("Catagory: ${_currentFood.image}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Form"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _formkey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              _showImage(),
              SizedBox(height: 16.0,),
              Text(
                 widget.isUpdating ? "Updating Food Item" : "ADD Food Item",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(height: 16.0,),
              _imageFile == null && _imageUrl == null
               ? ButtonTheme(
                child: RaisedButton(
                  onPressed: ()=> _getLocalImage(),
                  child: Text(
                    "Add Image",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              :SizedBox(height: 0.0,),

              _buildNameField(),
              _buildCatagoryField(),
              _buildOnSaleField(),
              _buildDiscriptionField(),
              _buildPriceField(),
              _buildDiscountField(),


              SizedBox(height: 16.0,),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveFood(),
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}

