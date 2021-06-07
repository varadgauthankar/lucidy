import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/date_picker.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/widgets/tab_info_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  DateTime date = DateTime.now();

  bool isLucidDream = false;
  bool isNightmare = false;
  bool isSleepParalysis = false;

  List<String> allLabels = ['Fun', 'Sad', 'Adventure', 'Horror'];
  List<String> selectedLabels = [];
  List<String> userCreatedLabels = [];

  final noteController = TextEditingController();

  List<Widget> buildChips() {
    List<Widget> selection = [];
    allLabels.forEach((label) {
      selection.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(label),
          selectedColor: MyColors.accent,
          onSelected: (val) {
            setState(() {
              if (val)
                selectedLabels.add(label);
              else
                selectedLabels.remove(label);
            });
          },
          selected: selectedLabels.contains(label),
        ),
      ));
    });
    return selection;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(6.0),
      children: [
        //info card
        TabInfoCard(
          title: 'Info',
          child: Column(
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_rounded),
                    spacer(width: 6.0),
                    Text(DateFormat('EEE, dd MMM yyyy').format(date)),
                  ],
                ),
                onPressed: () => selectDate(context, date).then((pickedDate) {
                  setState(() {
                    this.date = pickedDate;
                  });
                }),
              ),

              Divider(),

              //checkbox lists
              CheckboxListTile(
                title: Text('Lucid Dream'),
                value: isLucidDream,
                onChanged: (value) {
                  setState(() {
                    this.isLucidDream = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Nightmare'),
                value: isNightmare,
                onChanged: (value) {
                  setState(() {
                    this.isNightmare = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Sleep Paralysis'),
                value: isSleepParalysis,
                onChanged: (value) {
                  setState(() {
                    this.isSleepParalysis = value;
                  });
                },
              ),
            ],
          ),
        ),
        TabInfoCard(
          title: 'Labels',
          child: Wrap(children: buildChips()),
        ),

        Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            maxLines: null,
            controller: noteController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Note",
              hintText: "Note (optional)",
            ),
          ),
        ),
      ],
    );
  }
}
