import 'package:dream_journal/modals/dream.dart';
import 'package:hive/hive.dart';

class DreamController {
  static const boxName = 'dreams';
  Box<Dream> box = Hive.box(boxName);

  void insertDream(Dream dream) => box.add(dream);

  void updateDream(int key, Dream dream) => box.put(key, dream);

  void deleteDream(int key) => box.delete(key);
}

class LabelController {
  static const boxName = 'labels';
  static const key = 'labels';
  Box<List<String>> box = Hive.box<List<String>>(boxName);

  void insertLabels(List<String> labels) => box.put(key, labels);

  List<String> getLabels() => box.get(key);
}
