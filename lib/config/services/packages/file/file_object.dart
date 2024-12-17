// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schools_map/config/constants/hive_enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
// export 'package:schools_map/config/services/packages/file/f_type.dart';

part 'file_object.g.dart';

// typedef FType = FileType;
@HiveType(typeId: 200)
enum FType {
  @HiveField(0)
  any,
  @HiveField(1)
  media,
  @HiveField(2)
  image,
  @HiveField(3)
  video,
  @HiveField(4)
  audio,
  @HiveField(5)
  pdf,
  @HiveField(6)
  excel,
  @HiveField(7)
  word,
  @HiveField(8)
  powerpoint,
  @HiveField(9)
  text,
  @HiveField(10)
  archive,
  @HiveField(11)
  custom;

  bool get isImage => super == image;
  bool get isVideo => super == video;
}

@HiveType(typeId: 201)
class FileObject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? path;
  @HiveField(2)
  Uint8List? bytes;
  @HiveField(3)
  String format;
  @HiveField(4)
  int sizeInBytes;
  @HiveField(5)
  double sizeInMB;
  // @HiveField(6)
  File? file;
  @HiveField(7)
  FileSource source;
  @HiveField(8)
  FType type;
  @HiveField(9)
  int? id;
  FileObject({
    required this.name,
    this.path,
    this.bytes,
    this.format = '.',
    this.sizeInBytes = 0,
    this.sizeInMB = 0.0,
    this.file,
    this.source = FileSource.network,
    this.type = FType.any,
    this.id,
  }) {
    format = name.split('.').last;
    sizeInMB = sizeInBytes / 1048576;
  }

  FileObject copyWith({
    String? name,
    String? path,
    Uint8List? bytes,
    String? format,
    int? sizeInBytes,
    double? sizeInMB,
    File? file,
    FileSource? source,
    FType? type,
    int? id,
  }) {
    return FileObject(
      name: name ?? this.name,
      path: path ?? this.path,
      bytes: bytes ?? this.bytes,
      format: format ?? this.format,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      sizeInMB: sizeInMB ?? this.sizeInMB,
      file: file ?? this.file,
      source: source ?? this.source,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toPath() {
    return <String, dynamic>{
      'name': name,
      'path': path,
      'bytes': bytes,
      'format': format,
      'sizeInBytes': sizeInBytes,
      'sizeInMB': sizeInMB,
      'file': file,
      'source': source.name,
      'type': type.name,
    };
  }

  factory FileObject.fromAsset(dynamic path) {
    final name = ((path as String?) ?? 'name.unknown').split('/').last;
    final format = name.split('.').last;
    final type = FileFormats.icons[format] ?? FType.any;
    return FileObject(
      name: name,
      format: format,
      path: path,
      source: FileSource.asset,
      type: type,
    );
  }

  factory FileObject.fromFile(File file) {
    final name = file.path.split('/').last;
    final format = name.split('.').last;
    final type = FileFormats.icons[format] ?? FType.any;
    return FileObject(
      name: name,
      format: format,
      path: file.path,
      source: FileSource.file,
      type: type,
      file: file,
    );
  }

  factory FileObject.fromUrl(dynamic url, {int? id}) {
    final name = ((url as String?) ?? 'name.unknown').split('/').last;
    final format = name.split('.').last;
    final type = FileFormats.icons[format] ?? FType.any;
    return FileObject(
        name: name,
        format: format,
        path: url,
        source: FileSource.network,
        type: type,
        id: id);
  }

  static List<FileObject> fromUrlList(List list) {
    return list.map((e) => FileObject.fromUrl(e)).toList();
  }

//   Future<void> applyRotationFix(String originalPath) async {
//   try {
//     Map<String, IfdTag> data = await readExifFromFile(File(originalPath));
//     print(data);

//     int length = int.parse(data['EXIF ExifImageLength'].toString());
//     int width = int.parse(data['EXIF ExifImageWidth'].toString());
//     String orientation = data['Image Orientation'].toString();

//     if (length != null && width != null && orientation != null) {
//       if (length > width) {
//         if (orientation.contains('Rotated 90 CW')) {
//           img.Image original =
//               img.decodeImage(File(originalPath).readAsBytesSync());
//           img.Image fixed = img.copyRotate(original, -90);
//           File(originalPath).writeAsBytesSync(img.encodeJpg(fixed));
//         } else if (orientation.contains('Rotated 180 CW')) {
//           img.Image original =
//               img.decodeImage(File(originalPath).readAsBytesSync());
//           img.Image fixed = img.copyRotate(original, -180);
//           File(originalPath).writeAsBytesSync(img.encodeJpg(fixed));
//         } else if (orientation.contains('Rotated 270 CW')) {
//           img.Image original =
//               img.decodeImage(File(originalPath).readAsBytesSync());
//           img.Image fixed = img.copyRotate(original, -270);
//           File(originalPath).writeAsBytesSync(img.encodeJpg(fixed));
//         }
//       }
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

  @override
  String toString() {
    return 'FileObject(id: $id, name: $name, path: $path,  format: $format, sizeInBytes: $sizeInBytes, sizeInMB: $sizeInMB, file: $file, source: $source, type: $type, bytes: ${bytes?.length})';
  }

  @override
  bool operator ==(covariant FileObject other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.path == path &&
        other.bytes == bytes &&
        other.format == format &&
        other.sizeInBytes == sizeInBytes &&
        other.sizeInMB == sizeInMB &&
        other.file == file &&
        other.source == source &&
        other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        path.hashCode ^
        bytes.hashCode ^
        format.hashCode ^
        sizeInBytes.hashCode ^
        sizeInMB.hashCode ^
        file.hashCode ^
        source.hashCode ^
        type.hashCode;
  }
}

class FileFormats {
  static const Map<String, FType> icons = {
    'jpg': FType.image,
    'jpeg': FType.image,
    'png': FType.image,
    'gif': FType.image,
    'bmp': FType.image,
    'tiff': FType.image, // TIFF image extension
    'ts': FType.video,
    'mp4': FType.video,
    'avi': FType.video,
    'mkv': FType.video,
    'mov': FType.video, // QuickTime video extension
    'wmv': FType.video, // Windows Media Video extension
    'mp3': FType.audio,
    'wav': FType.audio,
    'ogg': FType.audio,
    'flac': FType.audio, // FLAC audio extension
    'aac': FType.audio, // AAC audio extension
    'pdf': FType.pdf,
    'xlsx': FType.excel,
    'xls': FType.excel,
    'doc': FType.word,
    'docx': FType.word,
    'pptx': FType.powerpoint,
    'ppt': FType.powerpoint,
    'txt': FType.text,
    'csv': FType.text,
    'html': FType.text,
    'xml': FType.text,
    'zip': FType.archive,
    'rar': FType.archive,
    '7z': FType.archive,
    'tar': FType.archive,
    'gz': FType.archive,
  };

  static Widget getIcon(String format, {double? size = 24}) {
    final svgFile = icons[format];
    return SvgPicture.asset(
      'assets/svgs/files/${svgFile?.name ?? 'file'}.svg',
      width: size,
      height: size,
    );
  }

// class Svvg extends SvgPicture {
//   Svvg.asset(
//     String iconName, {
//     super.key,
//     double? size,
//     double? h,
//     double? w,
//     BoxFit? fit,
//     Color? color,
//     String? fileName,
//   }) : super.asset(
//           'assets/${fileName ?? 'icons'}/$iconName.svg',
//           height: size ?? h,
//           width: size ?? w,
//           fit: fit ?? BoxFit.contain,
//           // ignore: deprecated_member_use
//           color: color,
//         );
}
