import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/widgets/dream_card.dart';
import 'package:flutter/material.dart';
import 'package:dream_journal/pages/dream_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isThemeDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dreams'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_5),
            color: MyColors.white,
            onPressed: () {},
          )
        ],
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => DreamDetail())),
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: MyColors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(6.0),
        scrollDirection: Axis.vertical,
        children: [
          DreamCard(
            date: 'mon • 21 Jan 2021',
            title: 'test',
            subTitle:
                'Adipisicing ad culpa ullamco consectetur minim commodo cupidatat adipisicing consectetur pariatur culpa cupidatat labore magna. Laboris reprehenderit anim velit deserunt veniam labore commodo laboris laborum. Ipsum sint labore magna labore reprehenderit dolore eiusmod laboris adipisicing nostrud labore.',
            oneTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DreamDetail())),
          ),
        ],
      ),
    );
  }
}
