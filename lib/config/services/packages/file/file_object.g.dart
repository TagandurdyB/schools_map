// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileObjectAdapter extends TypeAdapter<FileObject> {
  @override
  final int typeId = 201;

  @override
  FileObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileObject(
      name: fields[0] as String,
      path: fields[1] as String?,
      bytes: fields[2] as Uint8List?,
      format: fields[3] as String,
      sizeInBytes: fields[4] as int,
      sizeInMB: fields[5] as double,
      source: fields[7] as FileSource,
      type: fields[8] as FType,
      id: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FileObject obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.bytes)
      ..writeByte(3)
      ..write(obj.format)
      ..writeByte(4)
      ..write(obj.sizeInBytes)
      ..writeByte(5)
      ..write(obj.sizeInMB)
      ..writeByte(7)
      ..write(obj.source)
      ..writeByte(8)
      ..write(obj.type)
      ..writeByte(9)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FTypeAdapter extends TypeAdapter<FType> {
  @override
  final int typeId = 200;

  @override
  FType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FType.any;
      case 1:
        return FType.media;
      case 2:
        return FType.image;
      case 3:
        return FType.video;
      case 4:
        return FType.audio;
      case 5:
        return FType.pdf;
      case 6:
        return FType.excel;
      case 7:
        return FType.word;
      case 8:
        return FType.powerpoint;
      case 9:
        return FType.text;
      case 10:
        return FType.archive;
      case 11:
        return FType.custom;
      default:
        return FType.any;
    }
  }

  @override
  void write(BinaryWriter writer, FType obj) {
    switch (obj) {
      case FType.any:
        writer.writeByte(0);
        break;
      case FType.media:
        writer.writeByte(1);
        break;
      case FType.image:
        writer.writeByte(2);
        break;
      case FType.video:
        writer.writeByte(3);
        break;
      case FType.audio:
        writer.writeByte(4);
        break;
      case FType.pdf:
        writer.writeByte(5);
        break;
      case FType.excel:
        writer.writeByte(6);
        break;
      case FType.word:
        writer.writeByte(7);
        break;
      case FType.powerpoint:
        writer.writeByte(8);
        break;
      case FType.text:
        writer.writeByte(9);
        break;
      case FType.archive:
        writer.writeByte(10);
        break;
      case FType.custom:
        writer.writeByte(11);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
