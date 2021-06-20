import 'package:dream_journal/widgets/statistics_card.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StatisticsCard(title: 'All Dreams', value: '10'),
              Row(
                children: [
                  Expanded(
                    child: StatisticsCard(title: 'All Dreams', value: '10'),
                  ),
                  Expanded(
                    child: StatisticsCard(title: 'All Dreams', value: '10'),
                  ),
                ],
              ),
              StatisticsCard2(
                title1: 'Nightmares',
                value1: '12',
                title2: 'sleep parlysis',
                value2: '2',
              ),
              StatisticsCard3(
                title: 'Dreams by label',
                child: Column(
                  children: [Text('later')],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
