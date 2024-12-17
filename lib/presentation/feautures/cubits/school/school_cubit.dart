import 'package:schools_map/config/core/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_state.dart';
part 'school_cubit.freezed.dart';

class SchoolCubit extends Cubit<SchoolState> {
  final SchoolRepo repository;
  SchoolCubit(this.repository) : super(const SchoolState.loading());

  Future<List<SchoolEntity>?> fill(RegionEntity region) async {
    final schoolsPath = region.csvPath;
    _SchoolReady? v;
    state.maybeMap(orElse: () {}, ready: (value) => v = value);
    emit(const SchoolState.loading());
    try {
      var result = await repository.schools(schoolsPath);
      if (v == null) {
        final newVal = {region: result};
        emit(SchoolState.ready(objs: newVal));
      } else if (v!.objs[region] == null) {
        var newVal = Map<RegionEntity, List<SchoolEntity>>.from(v!.objs);
        newVal[region] = result;
        emit(v!.copyWith(objs: newVal));
      } else {
        emit(v!);
      }
      return result;
    } catch (e, s) {
      print("ERROR:=$e,  $s");
      emit(SchoolState.err(e));
    }
    return null;
  }
}
