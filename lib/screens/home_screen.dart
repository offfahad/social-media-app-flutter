import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          centerTitle: true,
          title: Text(
            'FREZY',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600,),
            unselectedLabelStyle: const TextStyle(fontSize: 18.0),
            indicatorWeight: 3.0,
            tabs: const [
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Latest',
              )
            ],
          ),
          actions: []),
    );
  }
}
