import 'package:devtools_example/componens/my_description_box.dart';
import 'package:devtools_example/componens/my_drawer.dart';
import 'package:devtools_example/componens/my_sliver_app_bar.dart';
import 'package:devtools_example/componens/my_tab_bar.dart';
import 'package:flutter/material.dart';

import '../componens/my_current_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //My Current Location
                const MyCurrentLocation(),

                //description Box
                const MyDescriptionBox(),
              ],
            ),
          )
        ],
        body: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
