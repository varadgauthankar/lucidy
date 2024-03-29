import 'package:lucidy/controllers/data_controller.dart';
import 'package:lucidy/modals/dream.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/date_picker.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/widgets/add_label_popup.dart';
import 'package:lucidy/widgets/tab_info_card.dart';
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
  TextEditingController noteController;

  @override
  void initState() {
    noteController = TextEditingController();

    if (widget.isEdit) noteController.text = widget.dreamInfo.note;

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
    // data.getLabels();
    List<Widget> selection = [];
    data.getLabels().forEach((label) {
      selection.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          selectedColor: MyColors.accent,
          label: Text(label),
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
        padding: EdgeInsets.all(4.0),
        children: [
          //info card
          TabInfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info',
                  style: isThemeDark(context)
                      ? InfoCardTitle.dark
                      : InfoCardTitle.light,
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
                      style: isThemeDark(context)
                          ? InfoCardTitle.dark
                          : InfoCardTitle.light,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '+ Label',
                        style: isThemeDark(context)
                            ? InfoCardLeading.dark
                            : InfoCardLeading.light,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddLabelDialog(),
                        );
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
