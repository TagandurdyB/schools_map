import '../data_sources/school_source.dart';
import '../models/school_model.dart';

class SchoolRepo {
  final SchoolSource source;
  SchoolRepo(this.source);

  Future<List<SchoolModel>> schools(String path) async {
    List<SchoolModel> result = [];
    final objs = await source.schools(path);
    try {
      result = objs.map((e) => SchoolModel.fromMap(e)).toList();
    } catch (e, s) {
      throw "ERROR in SchoolRepo>schools: $e ; \n $s";
    }
    return result;
  }
}
