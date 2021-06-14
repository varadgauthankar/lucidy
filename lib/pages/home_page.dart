import 'package:dream_journal/controllers/hive_controller.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/widgets/dream_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dream_journal/pages/dream_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isThemeDark = false;

  DreamController dreamController;

  @override
  void initState() {
    dreamController = DreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dreams'),
      ),

      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: dreamController.box.listenable(),
              builder: (context, dreams, widget) {
                var dreamsList = dreams.values.toList();
                if (dreams.isNotEmpty) {
                  return ListView.builder(
                    itemCount: dreamsList.length,
                    itemBuilder: (context, index) {
                      var dream = dreamsList[index];
                      return DreamCard(
                        title: dream.title,
                        description: dream.description,
                        date: dream.dreamInfo.dateCreated.toString(),
                        oneTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DreamDetail(
                              dream: dream,
                              isEdit: true,
                              dreamKey: dream.key,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text('EMPTY JUST LIKE MY LIFE');
                }
              },
            ),
          ),
        ],
      ),

      //FAB
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DreamDetail(
                  isEdit: false,
                  dream: null,
                ),
              ));
        },
        elevation: 8,
        child: Icon(
          EvaIcons.plusOutline,
          color: MyColors.black,
        ),
      ),
    );
  }
}
