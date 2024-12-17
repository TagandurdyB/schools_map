part of 'region_cubit.dart';

@freezed
class RegionState with _$RegionState {
  const factory RegionState.loading() = _RegionLoading;
  const factory RegionState.err(dynamic res) = _RegionErr;
  const factory RegionState.ready({
    required List<RegionEntity> objs,
  }) = _RegionReady;
}
