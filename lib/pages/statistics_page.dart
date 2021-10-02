import 'package:lucidy/controllers/data_controller.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/widgets/statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    DataController dataController =
        Provider.of<DataController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: AppBarTitleStyle.lightDark,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatisticsCard(
                title: 'All Dreams',
                value: dataController.getAllDreamsCount().toString(),
              ),
              Row(
                children: [
                  Expanded(
                    child: StatisticsCard(
                      title: 'Non Lucid',
                      value: dataController.getNonLucidDreamsCount().toString(),
                    ),
                  ),
                  Expanded(
                    child: StatisticsCard(
                      title: 'Lucid',
                      value: dataController.getLucidDreamsCount().toString(),
                    ),
                  ),
                ],
              ),
              StatisticsCard2(
                title1: 'Nightmares',
                value1: dataController.getAllNightmaresCount().toString(),
                title2: 'Sleep paralysis',
                value2: dataController.getAllSleepParalysisCount().toString(),
              ),
              StatisticsCard3(
                isLabels: dataController.getDreamCountByLabel().isNotEmpty,
                title: 'Dreams by label',
                child: dataController.getDreamCountByLabel().isNotEmpty
                    ? Wrap(children: dataController.getDreamCountByLabel())
                    : Text('NO DREAMS WITH LABELS YET!'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
