// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LangAdapter extends TypeAdapter<Lang> {
  @override
  final int typeId = 0;

  @override
  Lang read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 2:
        return Lang.en;
      case 1:
        return Lang.ru;
      case 0:
        return Lang.tm;
      default:
        return Lang.en;
    }
  }

  @override
  void write(BinaryWriter writer, Lang obj) {
    switch (obj) {
      case Lang.en:
        writer.writeByte(2);
        break;
      case Lang.ru:
        writer.writeByte(1);
        break;
      case Lang.tm:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LangAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FileSourceAdapter extends TypeAdapter<FileSource> {
  @override
  final int typeId = 1;

  @override
  FileSource read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FileSource.asset;
      case 1:
        return FileSource.network;
      case 2:
        return FileSource.file;
      case 3:
        return FileSource.memory;
      case 4:
        return FileSource.err;
      default:
        return FileSource.asset;
    }
  }

  @override
  void write(BinaryWriter writer, FileSource obj) {
    switch (obj) {
      case FileSource.asset:
        writer.writeByte(0);
        break;
      case FileSource.network:
        writer.writeByte(1);
        break;
      case FileSource.file:
        writer.writeByte(2);
        break;
      case FileSource.memory:
        writer.writeByte(3);
        break;
      case FileSource.err:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
