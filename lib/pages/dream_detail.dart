import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/controllers/hive_controller.dart';
import 'package:dream_journal/modals/dream.dart';
import 'package:dream_journal/pages/tab_dream_page.dart';
import 'package:dream_journal/pages/tab_info_page.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/widgets/delete_dream_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DreamDetail extends StatefulWidget {
  final Dream dream;
  final bool isEdit;
  final int dreamKey;

  DreamDetail({Key key, this.dream, this.isEdit, this.dreamKey})
      : super(key: key);

  @override
  _DreamDetailState createState() => _DreamDetailState();
}

class _DreamDetailState extends State<DreamDetail>
    with TickerProviderStateMixin {
  TabController tabController;
  IconData fabIcon = EvaIcons.chevronRightOutline;
  DreamController dreamController;

  void handleFab() {
    if (tabController.index == 0)
      setState(() {
        fabIcon = EvaIcons.chevronRightOutline;
      });
    else
      setState(() {
        fabIcon = EvaIcons.checkmarkOutline;
      });
  }

  setData() {
    var dataController = Provider.of<DataController>(context, listen: false);
    var dream = widget.dream;
    dataController.setTitle(dream.title);
    dataController.setDescription(dream.description);
    dataController.setNote(dream.dreamInfo.note);
    dataController.setDate(dream.dreamInfo.dateCreated);
    dataController.setIsLucidDream(dream.dreamInfo.isLucid);
    dataController.setIsNightmare(dream.dreamInfo.isNightMare);
    dataController.setIsSleepParalysis(dream.dreamInfo.isSleepParalysis);
    dataController.setSelectedLabels(dream.dreamInfo.labels);
    dataController.setIsFavorite(dream.dreamInfo.isFavorite);
    dataController.setIsArchive(dream.dreamInfo.isArchive);
  }

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(handleFab);
    dreamController = DreamController();

    Future.delayed(Duration.zero, () {
      if (widget.isEdit)
        setData();
      else
        Provider.of<DataController>(context, listen: false).resetValues();
    });

    super.initState();
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
            actions: [
              IconButton(
                tooltip: 'Mark as favorite',
                icon: Icon(EvaIcons.starOutline),
                onPressed: () {},
              ),
              widget.isEdit
                  ? IconButton(
                      tooltip: 'Archive dream',
                      icon: Icon(EvaIcons.archiveOutline),
                      onPressed: () {},
                    )
                  : nothing(),
              widget.isEdit
                  ? IconButton(
                      tooltip: 'Delete dream',
                      icon: Icon(EvaIcons.trashOutline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmDelete(
                            dreamKey: widget.dreamKey,
                          ),
                        );
                      },
                    )
                  : nothing(),
            ],
            bottom: TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(EvaIcons.bulbOutline), text: 'DREAM'),
                Tab(icon: Icon(EvaIcons.infoOutline), text: 'INFO'),
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
          floatingActionButton: floatingActionButton(),
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
      child: Icon(fabIcon),
      onPressed: () {
        bool isFormValid = context.read<DataController>().validateForm();
        int tab = tabController.index;
        if (!isFormValid && tab == 1)
          tabController.animateTo(0);
        else if (isFormValid && tab == 0)
          tabController.animateTo(1);
        else if (isFormValid && tab == 1) {
          if (widget.isEdit)
            dreamController.updateDream(widget.dreamKey,
                Provider.of<DataController>(context, listen: false).getDream());
          else
            dreamController.insertDream(
                Provider.of<DataController>(context, listen: false).getDream());

          Navigator.of(context).pop();
        }
      },
    );
  }
}
