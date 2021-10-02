import 'package:lucidy/constants/hive_boxes.dart';
import 'package:lucidy/modals/dream.dart';
import 'package:hive/hive.dart';

class DreamController {
  static Box<Dream> box = Hive.box(kDreamsBox);

  static void insertDream(Dream dream) => box.add(dream);

  static void updateDream(int key, Dream dream) => box.put(key, dream);

  static void deleteDream(int key) => box.delete(key);
}

class LabelController {
  static const key = 'labels';
  static Box<String> box = Hive.box<String>(kLabelsBox);

  static void addLabel(String label) => box.add(label);

  static List<String> getLabels() => box.values.toList();

  static void initLabels() {
    final defaultLabels = ['Fun', 'Scary', 'Love', 'Sad'];
    if (getLabels().isEmpty || getLabels() == null) {
      for (var label in defaultLabels) {
        addLabel(label);
      }
    }
  }

  //TODO: implement model and use key for operation
  static void removeLabel(String label) {
    print('==================');
    print(getLabels().length);
    box.deleteAt(getLabels().indexOf(label));
  }
}
