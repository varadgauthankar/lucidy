import 'package:lucidy/controllers/settings_controller.dart';
import 'package:lucidy/services/noification_service.dart';
import 'package:lucidy/utils/enums.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/utils/time_picker.dart';
import 'package:lucidy/widgets/container_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  NotificationService notificationService = NotificationService();

  List<String> chipsValue = ['1 hour', '2 hour', '4 hour', '6 hour'];
  List<String> selectedFrequency = [];

  void handleRealityCheck(bool value) {
    var settingsController =
        Provider.of<SettingsController>(context, listen: false);
    settingsController.setIsRealityCheck(value);

    if (settingsController.isRealityCheck) {
      notificationService.scheduleFrequentNotification(
        title: 'Reality check',
        description: settingsController.message,
        startTime: settingsController.morningReminderTime,
        endTime: settingsController.beforeBedTime,
        frequency: settingsController.frequency,
      );
    } else {
      notificationService.cancelScheduledNotification();
    }
  }

  void handleMorningReminder(bool value) {
    var settingsController =
        Provider.of<SettingsController>(context, listen: false);
    settingsController.setIsMorningReminder(value);

    if (settingsController.isMorningReminder) {
      notificationService.scheduleNotification(
        id: 2,
        time: settingsController.morningReminderTime,
        title: 'Add Dream',
        description: 'Make sure to add the dream.',
      );
    } else {
      notificationService.cancelNotification(id: 2);
    }
  }

  void handleBeforeBedReminder(bool value) {
    var settingsController =
        Provider.of<SettingsController>(context, listen: false);
    settingsController.setIsBeforeBedReminder(value);

    if (settingsController.isBeforeBedReminder) {
      notificationService.scheduleNotification(
        id: 3,
        time: settingsController.beforeBedTime,
        title: 'Read morning dream',
        description: 'Make sure to read the morning dream.',
      );
    } else {
      notificationService.cancelNotification(id: 3);
    }
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
    var settingsController =
        Provider.of<SettingsController>(context, listen: false);
    List<Widget> choices = [];
    Frequency.values.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(getLabel(item)), //Enum to string, First letter capital
          selected: settingsController.frequency == item,
          onSelected: (_) {
            settingsController.setFrequency(item);
            if (settingsController.isRealityCheck) {
              notificationService.cancelNotification(id: 10);
              notificationService.scheduleFrequentNotification(
                title: 'Reality check',
                description: 'Are you dreaming?',
                startTime: settingsController.morningReminderTime,
                endTime: settingsController.beforeBedTime,
                frequency: settingsController.frequency,
              );
            }
          },
        ),
      ));
    });
    return choices;
  }

  @override
  void initState() {
    notificationService.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settingsController = Provider.of<SettingsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tools'),
        actions: [
          IconButton(
              onPressed: () {
                notificationService
                    .getPendingNotification()
                    .then((value) => print(value.length));
              },
              icon: Icon(EvaIcons.bookOutline)),
        ],
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
                  value: settingsController.isRealityCheck,
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
                        content:
                            'Recieve a reality check notification throughout the day',
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
                  controller: settingsController.messageController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    settingsController.setMessage(text);
                  },
                ),
              ],
            ),
          ),

          //Mornign reminder
          ContainerCard(
            title: 'Morning Reminder',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Reminder to log dreams just when you wake up'),
                  value: settingsController.isMorningReminder,
                  onChanged: (value) => handleMorningReminder(value),
                ),
                Text(
                  'Pick a time',
                  style: ContainerCardSubTitle.light,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () async {
                    var pickedTime = await selectTime(context,
                        initialTime: settingsController.morningReminderTime);
                    settingsController.setMorningReminderTime(pickedTime);
                  },
                  child: Row(
                    children: [
                      Icon(EvaIcons.clockOutline),
                      spacer(width: 6.0),
                      Text(settingsController.morningReminderTime
                          .format(context)),
                    ],
                  ),
                )
              ],
            ),
          ),

          //before bed
          ContainerCard(
            title: 'Before bed Reminder',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                      'Reminder to read morning dreams. an essensial way to make lucid dreams work'),
                  value: settingsController.isBeforeBedReminder,
                  onChanged: (value) => handleBeforeBedReminder(value),
                ),
                Text(
                  'Pick a time',
                  style: ContainerCardSubTitle.light,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () async {
                    var pickedTime = await selectTime(context,
                        initialTime: settingsController.beforeBedTime);
                    settingsController.setBeforeBedTime(pickedTime);
                  },
                  child: Row(
                    children: [
                      Icon(EvaIcons.clockOutline),
                      spacer(width: 6.0),
                      Text(settingsController.beforeBedTime.format(context)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
