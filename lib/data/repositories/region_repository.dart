import '../data_sources/region_source.dart';
import '../models/region_model.dart';

class RegionRepo {
  final RegionSource source;
  RegionRepo(this.source);

  Future<List<RegionModel>> regions() async {
    List<RegionModel> result = [];
    final objs = await source.regions();
    try {
      result = objs.map((e) => RegionModel.fromMap(e)).toList();
    } catch (e, s) {
      throw "ERROR in RegionRepo>regions: $e ; \n $s";
    }
    return result;
  }

}
