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
  final String note;

  @HiveField(1)
  final bool isLucid;

  @HiveField(2)
  final bool isNightMare;

  @HiveField(3)
  final bool isSleepParalysis;

  @HiveField(4)
  final bool isFavorite;

  @HiveField(5)
  final bool isArchive;

  @HiveField(6)
  final List<String> labels;

  @HiveField(7)
  final DateTime dateCreated;

  DreamInfo({
    this.note,
    this.isLucid,
    this.isNightMare,
    this.isSleepParalysis,
    this.isFavorite,
    this.isArchive,
    this.labels,
    this.dateCreated,
  });
}
