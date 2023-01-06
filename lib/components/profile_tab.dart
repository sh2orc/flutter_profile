import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTabBar(), Expanded(child: _buildTabBarView())],
    );
  }

  _buildTabBar() {
    return TabBar(controller: _tabController, tabs: [
      Tab(
        icon: Icon(Icons.directions_car),
      ),
      Tab(
        icon: Icon(Icons.directions_transit),
      )
    ]);
  }

  _buildTabBarView() {
    return TabBarView(controller: _tabController, children: [
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 42,
          itemBuilder: (context, index) {
            return Image.network("http://picsum.photos/id/${index + 1}/200/200");
          }),
      Container(
        color: Colors.red,
      ),
    ]);
  }
}
