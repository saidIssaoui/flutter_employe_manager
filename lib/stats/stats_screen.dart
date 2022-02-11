import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/config/palette.dart';
import 'package:mobile_app/config/styles.dart';
import 'package:mobile_app/data/data.dart';
import 'package:mobile_app/widgets/tasks_bar_chart.dart';
import 'package:mobile_app/widgets/custom_app_bar.dart';
import 'package:mobile_app/widgets/stats_grid.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          // _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: TasksBarChart(tasks: tasksDaily),
            ),
          ),
        ],
      ),
    );
  }

  // SliverPadding _buildHeader() {
  //   return SliverPadding(
  //     padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
  //     sliver: SliverToBoxAdapter(
  //       child: Text(
  //         'Statistics',
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 25.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: const BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: const <Widget>[
              Text('Journalier'),
              Text('Tous les jours'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: const <Widget>[
              Text("Aujourd'hui"),
              Text('Hier'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
