import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/description.dart';
import 'package:flutter_application_4/components/drawer.dart';
import 'package:flutter_application_4/components/food_tile.dart';
import 'package:flutter_application_4/components/location.dart';
import 'package:flutter_application_4/components/navbar.dart';
import 'package:flutter_application_4/components/tab_bar.dart';
import 'package:flutter_application_4/models/food.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tabcontroller
  late TabController _tabController;
  
  @override 
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //

  //return list of food items...specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }
  
  //return food list in category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return  FoodTile(food: food, onTap: () {});
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          Navbar(
            title: Tabbar(tabController: _tabController), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //divider
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //location
                const CurrentLocation(),
                //description
                const MyDescriptionBox()
              ],
            )
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        )
        
      ),
    );
  }
}