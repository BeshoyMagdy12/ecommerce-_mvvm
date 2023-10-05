import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/prov_nav_bar_root.dart';

class NavBarRootScreen extends StatelessWidget {
  const NavBarRootScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var prov=Provider.of<ProvNavBarRoot>(context);

    return Scaffold(
      bottomNavigationBar: Consumer<ProvNavBarRoot>(
        builder: (BuildContext context, provider, Widget? child) {
          return BottomNavigationBar(
            items: provider.items,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            currentIndex: provider.currrentIndex,
            onTap: provider.changeScreen,
            elevation: 3,
          );
        },
      ),
      appBar: AppBar(
        title:const Text("TOKOTO"),
      ),
      body:context.read<ProvNavBarRoot>().screens[context.read<ProvNavBarRoot>().currrentIndex],
    );
  }
}
