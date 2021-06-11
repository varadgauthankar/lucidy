import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/controllers/dream_controller.dart';
import 'package:dream_journal/modals/dream.dart';
import 'package:dream_journal/pages/tab_dream_page.dart';
import 'package:dream_journal/pages/tab_info_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DreamDetail extends StatefulWidget {
  final Dream dream;
  final bool isEdit;

  DreamDetail({Key key, this.dream, this.isEdit}) : super(key: key);

  @override
  _DreamDetailState createState() => _DreamDetailState();
}

class _DreamDetailState extends State<DreamDetail>
    with TickerProviderStateMixin {
  TabController tabController;
  IconData fabIcon = Icons.arrow_forward_rounded;
  DreamController dreamController;

  void handleFab() {
    if (tabController.index == 0)
      setState(() {
        fabIcon = Icons.arrow_forward_rounded;
      });
    else
      setState(() {
        fabIcon = Icons.check_rounded;
      });
  }

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(handleFab);
    dreamController = DreamController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.isEdit ? 'Edit Dream' : 'Create Dream'),
            bottom: TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.person), text: 'DREAM'),
                Tab(icon: Icon(Icons.info_rounded), text: 'INFO'),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              TabDream(
                title: widget.dream?.title,
                description: widget.dream?.description,
                isEdit: widget.isEdit,
              ),
              TabInfo(
                isEdit: widget.isEdit,
                dreamInfo: widget.dream?.dreamInfo,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: tabController.index == 0 ? 'Next' : 'Done',
            child: Icon(fabIcon),
            onPressed: () {
              if (context.read<DataController>().validateForm()) {
                if (tabController.index == 0) {
                  tabController.animateTo(1);
                } else {
                  dreamController.insertDream(
                      Provider.of<DataController>(context, listen: false)
                          .getDream());
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
