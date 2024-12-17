import 'package:schools_map/config/core/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_state.dart';
part 'region_cubit.freezed.dart';

class RegionCubit extends Cubit<RegionState> {
  final RegionRepo repository;
  RegionCubit(this.repository) : super(const RegionState.loading());

  Future<List<RegionEntity>?> fill() async {
    emit(const RegionState.loading());
    try {
      final result = await repository.regions();
      emit(RegionState.ready(objs: result));
      return result;
    } catch (e, _) {
      emit(RegionState.err(e));
      return null;
    }
  }

}
