import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class DocumentFuncs {
  static List<String> strToList(String text) {
    LineSplitter ls = const LineSplitter();
    List<String> result = ls.convert(text);
    return result;
  }

  static Future<List<String>> readLinesFromAsset(String assetPath) async {
    final text = await rootBundle.loadString(assetPath);
    return strToList(text);
  }

  static Future<List<String>> readLinesFromAssetUtf16(String assetPath) async {
    try {
      // Load the file from assets as raw bytes
      final data = await rootBundle.load(assetPath);
      // Decode the bytes as UTF-16 (UTF-16 is typically BOM-less or with BOM)
      const utf = Utf8Decoder(allowMalformed: true);
      final utf16Decoded = utf.convert(data.buffer.asUint8List());
      print('Decoded UTF-16 Content from Asset:');
      print(utf16Decoded);
      return strToList(utf16Decoded);
    } catch (e) {
      print('Error loading or decoding file: $e');
    }
    return [];
  }
}
