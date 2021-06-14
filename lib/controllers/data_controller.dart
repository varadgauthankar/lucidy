import 'package:dream_journal/controllers/hive_controller.dart';
import 'package:dream_journal/modals/dream.dart';
import 'package:flutter/cupertino.dart';

class DataController extends ChangeNotifier {
  String title;
  String description;
  String note;
  DreamInfo dreamInfo = DreamInfo();
  DateTime date = DateTime.now();

  bool isLucidDream = false;
  bool isNightmare = false;
  bool isSleepParalysis = false;
  List<String> allLabels = ['Fun', 'Scary', 'Love', 'Sad'];
  List<String> selectedLabels = [];
  List<String> userCreatedLabels = [];

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

  void setUserCreatedLabels(List<String> list) {
    this.userCreatedLabels = list;
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
    notifyListeners();

    LabelController labelController = LabelController();
    labelController.insertLabels(this.allLabels);
  }

  List<String> getLabels() {
    LabelController labelController = LabelController();

    List<String> labelsFromBox;
    labelsFromBox = labelController.getLabels();
    if (labelsFromBox == null)
      return this.allLabels;
    else
      return labelsFromBox;
  }

  void setDefaultLabels() {}

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
    userCreatedLabels: $userCreatedLabels

    isFavorite: $isFavorite
    isArchive: $isArchive
    ''';
  }
}
