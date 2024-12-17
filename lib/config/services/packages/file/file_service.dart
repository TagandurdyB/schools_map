import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schools_map/config/constants/hive_enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

// import 'package:exif/exif.dart';
// import 'package:native_exif/native_exif.dart';
// import 'package:exif_reader/exif.dart';
// import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';

import 'file_object.dart';
export 'file_object.dart';

enum FileStatus {
  picking,
  done;

  bool get isPinking => super == picking;
  bool get isDone => super == done;
}

class FileService {
  static int getSumByte(List<Uint8List> bytes) {
    int totalByte = 0;
    for (var byte in bytes) {
      totalByte += byte.length;
    }
    return totalByte;
  }

  static int getSumPaths(List<String> paths) {
    int totalByte = 0;
    for (int i = 0; i < paths.length; i++) {
      final file = File(paths[i]);
      totalByte += file.lengthSync();
    }
    return totalByte;
  }

  static double getSumMB(List<String> paths, {List<Uint8List>? bytes}) {
    return (bytes == null ? getSumPaths(paths) : getSumByte(bytes)) / 1048576;
  }

  static double getSumObjMB(List<FileObject> objs) {
    double totalMB = 0;
    for (var o in objs) {
      totalMB += o.sizeInMB;
    }
    return totalMB;
  }

  static Future<List<FileObject>> pickMulti({
    FType? type,
    Function(FileStatus status)? onFileLoading,
  }) async {
    FileType pickType = FileType.any;
    try {
      pickType = FileType.values.byName(type!.name);
    } catch (_) {}
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: pickType,
        allowMultiple: true,
        // allowedExtensions: ["txt"],
        onFileLoading: (status) {
          if (onFileLoading != null) {
            onFileLoading(FileStatus.values.byName(status.name));
          }
        });
    List<FileObject> objs = [];
    if (result != null) {
      debugPrint(
          "==================================================================================================");
      if (kIsWeb) {
        for (var f in result.files) {
          objs.add(FileObject(
            name: f.name,
            bytes: f.bytes,
            path: null,
            source: FileSource.file,
            sizeInBytes: f.size,
            type: type ?? FType.any,
          ));
          debugPrint(f.name);
        }
      } else {
        for (var f in result.files) {
          final fileType = FileFormats.icons[f.extension] ?? FType.any;
          File file = File(f.path!);

          objs.add(FileObject(
            name: f.name,
            bytes: null,
            path: file.path,
            source: FileSource.file,
            sizeInBytes: f.size,
            type: fileType,
            file: f.path == null ? null : file,
          ));
          debugPrint("++++++++file:=$fileType");
          debugPrint(f.name);
          debugPrint(file.path);
        }
      }
      debugPrint("$objs");
      debugPrint(
          "==================================================================================================");
    } else {
      debugPrint("Image not selected!!!");
    }
    return objs;
  }

  static Future<FileObject?> pick(
    context, {
    FType? type,
    dynamic Function(FileStatus status)? onFileLoading,
  }) async {
    FileType pickType = FileType.any;
    try {
      pickType = FileType.values.byName(type!.name);
    } catch (_) {}
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: pickType,
        onFileLoading: (status) {
          if (onFileLoading != null) {
            onFileLoading(FileStatus.values.byName(status.name));
          }
        }
        // allowedExtensions: ["txt"],
        );

    FileObject? obj;
    if (result != null) {
      final f = result.files.first;
      if (kIsWeb) {
        obj = FileObject(
          name: f.name,
          bytes: f.bytes,
          path: null,
          source: FileSource.file,
          sizeInBytes: f.size,
          type: type ?? FType.any,
        );
      } else {
        final fileType = FileFormats.icons[f.extension] ?? FType.any;
        File file = File(f.path!);

        obj = FileObject(
          name: f.name,
          bytes: null,
          path: file.path,
          source: FileSource.file,
          sizeInBytes: f.size,
          type: fileType,
          file: f.path == null ? null : file,
        );
      }
    } else {
      debugPrint("Image not selected!!!");
    }
    return obj;
  }

  static Future<FileObject?> pickImageFromGallery({
    dynamic Function(FileStatus status)? onFileLoading,
  }) async {
    FileObject? selectedImage;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (kIsWeb) {
        return null;
      } else {
        File file = File(image.path);
        selectedImage = FileObject(
          name: image.name,
          bytes: null,
          path: file.path,
          source: FileSource.file,
          sizeInBytes: 0, //image.length(),
          type: FType.image,
          file: file, //f.path == null ? null : file,
        );
      }
    } else {
      debugPrint("Image not selected!!!");
    }
    return selectedImage;
  }
}
