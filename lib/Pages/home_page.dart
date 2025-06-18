import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/description.dart';
import 'package:flutter_application_4/components/drawer.dart';
import 'package:flutter_application_4/components/location.dart';
import 'package:flutter_application_4/components/navbar.dart';
import 'package:flutter_application_4/components/tab_bar.dart';
import 'package:flutter_application_4/models/food.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[
          Navbar(title: Tabbar(tabController: _tabController), child: Column(
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
              //descripttion
              const MyDescriptionBox()
            ],
          ))
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab1')
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab2')
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab3')
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab3')
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab3')
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Text('Tab3')
            ),
          ],
        )
      ),
      
    );
  }
}
