import 'package:dream_journal/modals/dream.dart';
import 'package:hive/hive.dart';

class DreamController {
  static const boxName = 'dreams';
  Box<Dream> box = Hive.box(boxName);

  insertDream(Dream dream) => box.add(dream);

  updateDream(int key, Dream dream) => box.put(key, dream);

  deleteDream(int key) => box.delete(key);
}
