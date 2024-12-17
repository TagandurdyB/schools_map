import 'package:schools_map/config/services/funcs/document_funcs.dart';

class SchoolSource {
  Future<List<Map>> schools(String path) async {
    List<Map> result = [];
    // final lines = await DocumentFuncs.readLinesFromAssetUtf16(path);
    final lines = await DocumentFuncs.readLinesFromAsset(path);
    try {
      final keys = lines.first.split(',');
      for (int i = 1; i < lines.length; i++) {
        final values = lines[i].split(',');
        final obj = {
          for (int j = 0; j < keys.length; j++) keys[j]: values[j],
        };
        result.add(obj);
      }
    } catch (e, s) {
      throw "ERROR in SchoolSource>schools: $e ; \n $s";
    }
    return result;
  }
}
