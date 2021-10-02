import 'package:flutter/material.dart';
import 'package:lucidy/controllers/hive_controller.dart';
import 'package:lucidy/modals/dream.dart';
import 'package:flutter/cupertino.dart';
import 'package:lucidy/utils/colors.dart';

class DataController extends ChangeNotifier {
  String title;
  String description;
  String note;
  DreamInfo dreamInfo = DreamInfo();
  DateTime date = DateTime.now();

  bool isLucidDream = false;
  bool isNightmare = false;
  bool isSleepParalysis = false;
  List<String> allLabels = [];
  List<String> selectedLabels = [];

  bool isFavorite = false;
  bool isArchive = false;

  //Key for dream details input
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //key for label input
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  void setDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void setDescription(String desc) {
    this.description = desc;
    notifyListeners();
  }

  void setDreamInfo(DreamInfo dreamInfo) {
    this.dreamInfo = dreamInfo;
    notifyListeners();
  }

  void setNote(String note) {
    this.note = note;
    notifyListeners();
  }

  void setIsLucidDream(bool value) {
    this.isLucidDream = value;
    notifyListeners();
  }

  void setIsNightmare(bool value) {
    this.isNightmare = value;
    notifyListeners();
  }

  void setIsSleepParalysis(bool value) {
    this.isSleepParalysis = value;
    notifyListeners();
  }

  void setIsFavorite(bool value) {
    this.isFavorite = value;
    notifyListeners();
  }

  void setIsArchive(bool value) {
    this.isArchive = value;
    notifyListeners();
  }

  void setAllLabels(List<String> list) {
    this.allLabels = list;
    notifyListeners();
  }

  void setSelectedLabels(List<String> list) {
    this.selectedLabels = list;
    notifyListeners();
  }

  Dream getDream() {
    Dream dream = Dream(
      title: this.title,
      description: this.description,
      dreamInfo: DreamInfo(
        dateCreated: this.date,
        isLucid: this.isLucidDream,
        isNightMare: this.isNightmare,
        isSleepParalysis: this.isSleepParalysis,
        isArchive: this.isArchive,
        isFavorite: this.isFavorite,
        note: this.note,
        labels: this.selectedLabels,
      ),
    );
    resetValues();
    return dream;
  }

  Dream updatedDream(Dream dream) {
    Dream _dream = Dream(
      title: dream.title,
      description: dream.description,
      dreamInfo: dream.dreamInfo,
    );
    resetValues();
    return _dream;
  }

  void addLabel(String label) {
    this.allLabels.add(label);
    LabelController.addLabel(label);
    notifyListeners();
  }

  void removeLabel(String label) {
    this.allLabels.removeAt(allLabels.indexOf(label));
    LabelController.removeLabel(label);
    notifyListeners();
  }

  List<String> getLabels() {
    List<String> labelsFromBox;
    labelsFromBox = LabelController.getLabels();
    // notifyListeners();

    if (labelsFromBox == null)
      return this.allLabels;
    else
      return labelsFromBox;
  }

  bool validateForm({String key}) {
    if (key == 'label')
      return formKey2.currentState.validate() ? true : false;
    else
      return formKey.currentState.validate() ? true : false;
  }

  void resetValues() {
    this.date = DateTime.now();
    this.isLucidDream = false;
    this.isNightmare = false;
    this.isSleepParalysis = false;
    this.selectedLabels = [];
    this.title = '';
    this.description = '';
    this.note = '';
    notifyListeners();
  }

  int getAllDreamsCount() {
    return DreamController.box.length;
  }

  int getNonLucidDreamsCount() {
    var count = 0;
    var allNonLucidDreams = DreamController.box.values;
    if (allNonLucidDreams.isNotEmpty) {
      allNonLucidDreams.forEach((dream) {
        if (!dream.dreamInfo.isLucid) {
          count++;
        }
      });
    }
    return count;
  }

  int getLucidDreamsCount() {
    var count = 0;
    var allLucidDreamsDreams = DreamController.box.values;
    if (allLucidDreamsDreams.isNotEmpty) {
      allLucidDreamsDreams.forEach((dream) {
        if (dream.dreamInfo.isLucid) {
          count++;
        }
      });
    }
    return count;
  }

  int getAllNightmaresCount() {
    var count = 0;
    var allNightmareDreams = DreamController.box.values;
    if (allNightmareDreams.isNotEmpty) {
      allNightmareDreams.forEach((dream) {
        if (dream.dreamInfo.isNightMare) {
          count++;
        }
      });
    }
    return count;
  }

  int getAllSleepParalysisCount() {
    var count = 0;
    var allSleepParalysis = DreamController.box.values;
    if (allSleepParalysis.isNotEmpty) {
      allSleepParalysis.forEach((dream) {
        if (dream.dreamInfo.isSleepParalysis) {
          count++;
        }
      });
    }
    return count;
  }

  List<Widget> getDreamCountByLabel() {
    List<Widget> chips = [];

    List allLabels = LabelController.getLabels();

    var allDreams = DreamController.box.values;

    if (allLabels.isNotEmpty) {
      for (var label in allLabels) {
        var count = 0;
        print(count);
        if (allDreams.isNotEmpty) {
          for (var dream in allDreams) {
            if (dream.dreamInfo.labels.isNotEmpty) {
              if (dream.dreamInfo.labels.contains(label)) {
                count++;
              }
            }
          }
        }
        if (count != 0)
          chips.add(
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Chip(
                backgroundColor: MyColors.accent.withOpacity(0.3),
                label: Text(label.toString()),
                avatar: CircleAvatar(
                  child: Text(count.toString()),
                  backgroundColor: MyColors.accentVarient,
                  foregroundColor: MyColors.white,
                ),
              ),
            ),
          );
      }
    }
    return chips;
  }

  @override
  String toString() {
    return '''
    date: $date
    title: $title
    description: $description
    note: $note

    isLucidDream: $isLucidDream
    isNightmare: $isNightmare
    isSleepParalysis: $isSleepParalysis
    selectedLabels: $selectedLabels

    allLabels: $allLabels

    isFavorite: $isFavorite
    isArchive: $isArchive
    ''';
  }
}
