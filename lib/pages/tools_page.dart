import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:dream_journal/widgets/container_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Frequency { one, two, four, six }

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  bool isRealityCheck = false;
  bool isMorningReminder = false;
  bool isBeforeBedReminder = false;
  Frequency frequency;
  final messageController = TextEditingController(text: 'Are you dreaming?');

  List<String> chipsValue = ['1 hour', '2 hour', '4 hour', '6 hour'];
  List<String> selectedFrequency = [];

  void handleRealityCheck(bool value) {
    setState(() {
      isRealityCheck = value;
    });
  }

  void handleMorningReminder(bool value) {
    setState(() {
      isRealityCheck = value;
    });
  }

  void handleBeforeBedReminder(bool value) {
    setState(() {
      isRealityCheck = value;
    });
  }

  String getLabel(frequency) {
    if (frequency == Frequency.one)
      return '1 hour';
    else if (frequency == Frequency.two)
      return '2 hour';
    else if (frequency == Frequency.four)
      return '4 hour';
    else if (frequency == Frequency.six)
      return '6 hour';
    else
      return '';
  }

  // build chips
  List<Widget> buildChips() {
    List<Widget> choices = [];
    Frequency.values.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(getLabel(item)), //Enum to string, First letter capital
          selected: frequency == item,
          onSelected: (selected) {
            setState(() {
              frequency = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tools'),
      ),
      body: ListView(
        children: [
          //Reality check
          ContainerCard(
            title: 'Reality Check',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Reality check throught out the day'),
                  value: isRealityCheck,
                  onChanged: (value) => handleRealityCheck(value),
                ),
                Row(
                  children: [
                    Text(
                      'Frequency',
                      style: ContainerCardSubTitle.light,
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 6.0),
                      constraints: BoxConstraints(), //removes big ass padding
                      onPressed: () => snackBar(
                        context,
                        content: 'todo', //Todo: add descripotion here
                      ),
                      icon: Icon(EvaIcons.questionMarkCircleOutline),
                    )
                  ],
                ),
                Wrap(
                  children: buildChips(),
                ),
                Text(
                  'Message',
                  style: ContainerCardSubTitle.light,
                ),
                spacer(height: 12.0),
                TextFormField(
                  controller: messageController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) {},
                ),
              ],
            ),
          ),

          //Mornign reminder
          ContainerCard(
            title: 'Morning Reminder',
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                      'Recieve a notification to remind you to log dreams just when you wake up'),
                  value: isRealityCheck,
                  onChanged: (value) => handleRealityCheck(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
