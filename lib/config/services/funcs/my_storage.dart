import 'dart:io';

import 'package:schools_map/config/core/exports.dart';
import 'package:path_provider/path_provider.dart';

String _storage = "/storage/emulated/0/Download/Pecs_cards";
Directory _storageDir = Directory(_storage);
Directory _temporaryDirectory = Directory(_storage);
Directory _applicationSupportDirectory = Directory(_storage);

class MyStorage {
  // static const photos = "$storage/Photos";
  // static const videos = "$storage/Videos";
  // static const downloads = "$storage/Downloads";
  // static final photosDir = Directory(photos);
  // static final videosDir = Directory(videos);
  // static final downloadsDir = Directory(downloads);
  static String get storage => _storage;
  static String get temporary => _temporaryDirectory.path;
  static String get applicationSupport => _applicationSupportDirectory.path;
  static Directory get storageDir => _storageDir;
  static Directory get temporaryDirectory => _temporaryDirectory;
  static Directory get appSupportDir => _applicationSupportDirectory;

  static Future<bool> init() async {
    bool isPermis = false;
    _temporaryDirectory = await getTemporaryDirectory();
    _applicationSupportDirectory = await getApplicationSupportDirectory();
    // await PermisService.getStoragePermission().then(
    //   (value) => isPermis = value,
    // );
    final dir = await getApplicationDocumentsDirectory();
    _storageDir = dir;
    _storage = dir.path;

    debugPrint('+++storage:=$storage');
    debugPrint('+++temporary:=$temporary');
    debugPrint('+++applicationSupport:=$applicationSupport');
    // if (isPermis) {
    //   try {
    //     switch (DeviceService.platform) {
    //       case DevicePlatform.iOS:
    //         {
    //           final dir = await getApplicationDocumentsDirectory();
    //           debugPrint('+++Absolute_path:=${dir.path}');
    //           _storageDir = dir;
    //           _storage = dir.path;
    //           debugPrint('+++Storage:=$_storage');
    //         }
    //         break;
    //       default:
    //         null;
    //     }
    //     return true;
    //   } catch (e) {
    //     debugPrint("++++++Storage init error:$e");
    //   }
    // }
    return true;
  }

  static Future<bool> create(Directory dir) async {
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      debugPrint("+${dir.path} created success!!!");
      return true;
    }
    return false;
  }

  static Future<void> get createDirs async {
    debugPrint("+Create All Files start!!!");

    await create(_storageDir);
    // await create(photosDir);
    // await create(videosDir);
    // await create(downloadsDir);
    debugPrint("+Create All Files!!!");
  }

  /// this will delete cache
  static Future<void> deleteCacheDir() async {
    var cacheDir = await getTemporaryDirectory();
    // try {
    //   await Directory(cacheDir).delete(recursive: true);
    // } catch (_) {}
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
      debugPrint("++++++Delete cache data : $cacheDir");
    }
  }

  /// this will delete app's storage
  static Future<void> deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();
    // try {
    //   await Directory(appDir).delete(recursive: true);
    //   debugPrint("++++++Delete app data");
    // } catch (_) {}
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
      debugPrint("++++++Delete app data : $appDir");
    }
  }

  static Future<bool> deleteFile(String path) async {
    try {
      final file = File(path);
      await file.delete();
      return true;
    } on FileSystemException {
      return false;
    }
  }

  static Future<bool> deleteDir(String dirPath) async {
    try {
      final dir = Directory(dirPath);
      dir.deleteSync(recursive: true);
      return true;
    } catch (e, s) {
      debugPrint("+++Dir not deleted :$e");
      return false;
    }
  }

  static Future<bool> exist(String path) async {
    final exist = await File(path).exists();
    debugPrint("$path exist: $exist");
    return exist;
  }

  static Future<File?> copy(String sourcePath, String newPath) async {
    final sourceFile = File(sourcePath);
    try {
      return await sourceFile.copy(newPath);
    } catch (_) {
      return null;
    }
  }

  static Future<File> moveFile(String sourcePath, String newPath) async {
    final sourceFile = File(sourcePath);
    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }

  Future<File> newFilePath(String filePath, {String? url}) async {
    //Check file is exist. If exist then make new file path
    int i = 0;
    final fileName = (url ?? filePath).split('/').last;
    filePath = filePath.substring(0, filePath.length - fileName.length);
    String newFileName = fileName;
    while (await exist("$filePath/$newFileName")) {
      i++;
      final splitFile = fileName.split('.');
      newFileName = "${splitFile.first}($i).${splitFile.last}";
    }
    return File("$filePath/$newFileName");
  }
}
