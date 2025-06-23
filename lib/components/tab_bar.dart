import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/food.dart';

class Tabbar extends StatelessWidget {

  final TabController tabController;
  const Tabbar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs (){
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}