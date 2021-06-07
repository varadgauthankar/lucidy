import 'package:dream_journal/pages/tab_dream_page.dart';
import 'package:dream_journal/pages/tab_info_page.dart';
import 'package:flutter/material.dart';

class DreamDetail extends StatefulWidget {
  DreamDetail({Key key}) : super(key: key);

  @override
  _DreamDetailState createState() => _DreamDetailState();
}

class _DreamDetailState extends State<DreamDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Dream'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'DREAM'),
              Tab(icon: Icon(Icons.info_rounded), text: 'INFO'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabDream(),
            TabInfo(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_rounded),
          onPressed: () {},
          tooltip: 'Add Dream',
        ),
      ),
    );
  }
}
