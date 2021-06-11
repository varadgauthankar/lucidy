import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/modals/dream.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/date_picker.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:dream_journal/widgets/add_label_popup.dart';
import 'package:dream_journal/widgets/tab_info_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TabInfo extends StatefulWidget {
  final DreamInfo dreamInfo;
  final bool isEdit;

  const TabInfo({Key key, this.dreamInfo, this.isEdit}) : super(key: key);
  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  bool isThemeDark = false;

  TextEditingController noteController;

  setData() {
    var dataController = Provider.of<DataController>(context, listen: false);
    var dreamData = widget.dreamInfo;
    noteController.text = widget.dreamInfo.note;
    dataController.setDate(dreamData.dateCreated);
    dataController.setIsLucidDream(dreamData.isLucid);
    dataController.setIsNightmare(dreamData.isNightMare);
    dataController.setIsSleepParalysis(dreamData.isSleepParalysis);
    dataController.setSelectedLabels(dreamData.labels);
    //todo: fav and archive
  }

  @override
  void initState() {
    noteController = TextEditingController();

    //stupid workaround #1
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (widget.isEdit) setData();
    // });

    //stupid workaround #2
    Future.delayed(Duration.zero, () async {
      if (widget.isEdit) setData();
    });

    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  // build chips
  List<Widget> buildChips() {
    DataController data = Provider.of<DataController>(context, listen: false);
    List<Widget> selection = [];
    data.allLabels.forEach((label) {
      selection.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(label),
          selectedColor: MyColors.accent,
          onSelected: (val) {
            setState(() {
              if (val)
                data.selectedLabels.add(label);
              else
                data.selectedLabels.remove(label);
            });
          },
          selected: data.selectedLabels.contains(label),
        ),
      ));
    });
    return selection;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (context, dataController, child) => ListView(
        padding: EdgeInsets.all(6.0),
        children: [
          //info card
          TabInfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info',
                  style: isThemeDark ? InfoCardTitle.dark : InfoCardTitle.light,
                ),
                spacer(height: 6.0),

                TextButton(
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_rounded),
                      spacer(width: 6.0),
                      Text(DateFormat('EEE, dd MMM yyyy')
                          .format(dataController.date)),
                    ],
                  ),
                  onPressed: () => selectDate(context, dataController.date)
                      .then((pickedDate) {
                    dataController.setDate(pickedDate);
                  }),
                ),

                Divider(),

                //checkbox lists
                CheckboxListTile(
                  title: Text('Lucid Dream'),
                  value: dataController.isLucidDream,
                  onChanged: (value) => dataController.setIsLucidDream(value),
                ),
                CheckboxListTile(
                  title: Text('Nightmare'),
                  value: dataController.isNightmare,
                  onChanged: (value) => dataController.setIsNightmare(value),
                ),
                CheckboxListTile(
                  title: Text('Sleep Paralysis'),
                  value: dataController.isSleepParalysis,
                  onChanged: (value) =>
                      dataController.setIsSleepParalysis(value),
                ),
              ],
            ),
          ),
          TabInfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Labels',
                      style: isThemeDark
                          ? InfoCardTitle.dark
                          : InfoCardTitle.light,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '+ Label',
                        style: isThemeDark
                            ? InfoCardLeading.dark
                            : InfoCardLeading.light,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AddLabelDialog());
                      },
                    )
                  ],
                ),
                Wrap(children: buildChips()),
              ],
            ),
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
              onChanged: (_) => dataController.setNote(noteController.text),
            ),
          ),
        ],
      ),
    );
  }
}
