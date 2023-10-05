import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../categories/presentation/view/categories_screen.dart';
import '../../../home/presentation/view/home_screen.dart';

class ProvNavBarRoot extends ChangeNotifier{

  List<BottomNavigationBarItem> items=const[
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.home_filled,)
    ),
    BottomNavigationBarItem(
        label: "Categories",
        icon: Icon(Icons.category,)
    ),    BottomNavigationBarItem(
        label: "favorite",
        icon: Icon(Icons.favorite,)
    ),
    BottomNavigationBarItem(
        label: "Cart",
        icon: Icon(Icons.shopping_cart,)
    ),
    BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(Icons.person,)
    ),

  ];
  List<Widget> screens=const [
    HomeScreen(),
    CategoriesScreen(),
    Center(child: Text("favorite"),),
    Center(child: Text("cart"),),
    Center(child: Text("Profile"),),



  ];
  //--------------function------------
  int _currentIndex=0;
  void changeScreen(int index){
    _currentIndex=index;
    notifyListeners();
  }
  int get currrentIndex=>_currentIndex;
  //--------------------------------------




}