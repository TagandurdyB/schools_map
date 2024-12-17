part of 'school_cubit.dart';

@freezed
class SchoolState with _$SchoolState {
  const factory SchoolState.loading() = _SchoolLoading;
  const factory SchoolState.err(dynamic res) = _SchoolErr;
  const factory SchoolState.ready({
    required Map<RegionEntity, List<SchoolEntity>> objs,
  }) = _SchoolReady;
}
