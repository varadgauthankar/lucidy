import 'package:hive/hive.dart';

part 'dream.g.dart';

@HiveType(typeId: 0)
class Dream extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final DreamInfo dreamInfo;

  Dream({this.title, this.description, this.dreamInfo});
}

@HiveType(typeId: 1)
class DreamInfo extends HiveObject {
  @HiveField(0)
  final DateTime dateCreated;

  @HiveField(1)
  final DateTime dateModified;

  @HiveField(2)
  final String note;

  @HiveField(3)
  final bool isLucid;

  @HiveField(4)
  final bool isNightmare;

  @HiveField(5)
  final bool isSleepParalysis;

  @HiveField(6)
  final bool isFavorite;

  @HiveField(7)
  final bool isArchive;

  @HiveField(8)
  final List<String> labels;

  DreamInfo(this.labels,
      {this.dateCreated,
      this.dateModified,
      this.note,
      this.isLucid,
      this.isNightmare,
      this.isSleepParalysis,
      this.isFavorite,
      this.isArchive});
}
