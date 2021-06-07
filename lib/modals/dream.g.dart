// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DreamAdapter extends TypeAdapter<Dream> {
  @override
  final int typeId = 0;

  @override
  Dream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dream(
      title: fields[0] as String,
      description: fields[1] as String,
      dreamInfo: fields[2] as DreamInfo,
    );
  }

  @override
  void write(BinaryWriter writer, Dream obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.dreamInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DreamInfoAdapter extends TypeAdapter<DreamInfo> {
  @override
  final int typeId = 1;

  @override
  DreamInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DreamInfo(
      dateCreated: fields[0] as DateTime,
      dateModified: fields[1] as DateTime,
      note: fields[2] as String,
      isLucid: fields[3] as bool,
      isNightmare: fields[4] as bool,
      isSleepParalysis: fields[5] as bool,
      isFavorite: fields[6] as bool,
      isArchive: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DreamInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.dateCreated)
      ..writeByte(1)
      ..write(obj.dateModified)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.isLucid)
      ..writeByte(4)
      ..write(obj.isNightmare)
      ..writeByte(5)
      ..write(obj.isSleepParalysis)
      ..writeByte(6)
      ..write(obj.isFavorite)
      ..writeByte(7)
      ..write(obj.isArchive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DreamInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
