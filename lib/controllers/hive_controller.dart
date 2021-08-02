import 'package:lucidy/modals/dream.dart';
import 'package:hive/hive.dart';

class DreamController {
  static const boxName = 'dreams';
  static Box<Dream> box = Hive.box(boxName);

  static void insertDream(Dream dream) => box.add(dream);

  static void updateDream(int key, Dream dream) => box.put(key, dream);

  static void deleteDream(int key) => box.delete(key);
}

class LabelController {
  static const boxName = 'labels';
  static const key = 'labels';
  static Box<List<String>> box = Hive.box<List<String>>(boxName);

  static void insertLabels(List<String> labels) => box.put(key, labels);

  static List<String> getLabels() => box.get(key);
}
