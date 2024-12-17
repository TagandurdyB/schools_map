import 'package:schools_map/config/services/funcs/document_funcs.dart';

class RegionSource {
  Future<List<Map>> regions() async {
    List<Map> result = [];
    final lines = await DocumentFuncs.readLinesFromAsset('assets/regions.csv');
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
      throw "ERROR in RegionSource>regions: $e ; \n $s";
    }
    return result;
  }
}
