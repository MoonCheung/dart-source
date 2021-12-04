import 'package:flutter/material.dart';

import 'counter_page.dart';
import 'notification.dart';
import 'event_bus_page.dart';

class DataTransfers extends StatelessWidget {
  const DataTransfers({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CounterPage(),
              NotificationWidget(),
              FirstPage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Inherited",
              ),
              Tab(
                icon: Icon(Icons.notifications),
                text: "Notification",
              ),
              Tab(
                icon: Icon(Icons.fingerprint),
                text: "EventBus",
              )
            ],
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.red,
          ),
        ));
  }
}
