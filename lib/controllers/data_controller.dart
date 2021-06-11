import 'package:dream_journal/modals/dream.dart';
import 'package:flutter/cupertino.dart';

class DataController extends ChangeNotifier {
  String title;
  String description;
  String note;
  DreamInfo dreamInfo;
  DateTime date = DateTime.now();

  bool isLucidDream = false;
  bool isNightmare = false;
  bool isSleepParalysis = false;
  List<String> allLabels = ['Fun', 'Scary', 'Love'];
  List<String> selectedLabels = [];
  List<String> userCreatedLabels = [];

  bool isFavorite = false;
  bool isArchive = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    return Dream(
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
  }

  void setDream(Dream dream) {
    this.title = dream.title;
    this.description = dream.description;
    this.dreamInfo = dream.dreamInfo;
    notifyListeners();
  }

  void addLabel(String labelTitle) {
    this.allLabels.add(labelTitle);
    notifyListeners();
  }

  bool validateForm() {
    if (formKey.currentState.validate())
      return true;
    else
      return false;
  }

  void resetValues() {
    this.dreamInfo = DreamInfo(
      isLucid: false,
      labels: [],
    );
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
