// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SchoolState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(Map<RegionEntity, List<SchoolEntity>> objs) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SchoolLoading value) loading,
    required TResult Function(_SchoolErr value) err,
    required TResult Function(_SchoolReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SchoolLoading value)? loading,
    TResult? Function(_SchoolErr value)? err,
    TResult? Function(_SchoolReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SchoolLoading value)? loading,
    TResult Function(_SchoolErr value)? err,
    TResult Function(_SchoolReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolStateCopyWith<$Res> {
  factory $SchoolStateCopyWith(
          SchoolState value, $Res Function(SchoolState) then) =
      _$SchoolStateCopyWithImpl<$Res, SchoolState>;
}

/// @nodoc
class _$SchoolStateCopyWithImpl<$Res, $Val extends SchoolState>
    implements $SchoolStateCopyWith<$Res> {
  _$SchoolStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SchoolLoadingImplCopyWith<$Res> {
  factory _$$SchoolLoadingImplCopyWith(
          _$SchoolLoadingImpl value, $Res Function(_$SchoolLoadingImpl) then) =
      __$$SchoolLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SchoolLoadingImplCopyWithImpl<$Res>
    extends _$SchoolStateCopyWithImpl<$Res, _$SchoolLoadingImpl>
    implements _$$SchoolLoadingImplCopyWith<$Res> {
  __$$SchoolLoadingImplCopyWithImpl(
      _$SchoolLoadingImpl _value, $Res Function(_$SchoolLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SchoolLoadingImpl implements _SchoolLoading {
  const _$SchoolLoadingImpl();

  @override
  String toString() {
    return 'SchoolState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SchoolLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(Map<RegionEntity, List<SchoolEntity>> objs) ready,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SchoolLoading value) loading,
    required TResult Function(_SchoolErr value) err,
    required TResult Function(_SchoolReady value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SchoolLoading value)? loading,
    TResult? Function(_SchoolErr value)? err,
    TResult? Function(_SchoolReady value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SchoolLoading value)? loading,
    TResult Function(_SchoolErr value)? err,
    TResult Function(_SchoolReady value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SchoolLoading implements SchoolState {
  const factory _SchoolLoading() = _$SchoolLoadingImpl;
}

/// @nodoc
abstract class _$$SchoolErrImplCopyWith<$Res> {
  factory _$$SchoolErrImplCopyWith(
          _$SchoolErrImpl value, $Res Function(_$SchoolErrImpl) then) =
      __$$SchoolErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic res});
}

/// @nodoc
class __$$SchoolErrImplCopyWithImpl<$Res>
    extends _$SchoolStateCopyWithImpl<$Res, _$SchoolErrImpl>
    implements _$$SchoolErrImplCopyWith<$Res> {
  __$$SchoolErrImplCopyWithImpl(
      _$SchoolErrImpl _value, $Res Function(_$SchoolErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_$SchoolErrImpl(
      freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SchoolErrImpl implements _SchoolErr {
  const _$SchoolErrImpl(this.res);

  @override
  final dynamic res;

  @override
  String toString() {
    return 'SchoolState.err(res: $res)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolErrImpl &&
            const DeepCollectionEquality().equals(other.res, res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(res));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolErrImplCopyWith<_$SchoolErrImpl> get copyWith =>
      __$$SchoolErrImplCopyWithImpl<_$SchoolErrImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(Map<RegionEntity, List<SchoolEntity>> objs) ready,
  }) {
    return err(res);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
  }) {
    return err?.call(res);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(res);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SchoolLoading value) loading,
    required TResult Function(_SchoolErr value) err,
    required TResult Function(_SchoolReady value) ready,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SchoolLoading value)? loading,
    TResult? Function(_SchoolErr value)? err,
    TResult? Function(_SchoolReady value)? ready,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SchoolLoading value)? loading,
    TResult Function(_SchoolErr value)? err,
    TResult Function(_SchoolReady value)? ready,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _SchoolErr implements SchoolState {
  const factory _SchoolErr(final dynamic res) = _$SchoolErrImpl;

  dynamic get res;
  @JsonKey(ignore: true)
  _$$SchoolErrImplCopyWith<_$SchoolErrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SchoolReadyImplCopyWith<$Res> {
  factory _$$SchoolReadyImplCopyWith(
          _$SchoolReadyImpl value, $Res Function(_$SchoolReadyImpl) then) =
      __$$SchoolReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<RegionEntity, List<SchoolEntity>> objs});
}

/// @nodoc
class __$$SchoolReadyImplCopyWithImpl<$Res>
    extends _$SchoolStateCopyWithImpl<$Res, _$SchoolReadyImpl>
    implements _$$SchoolReadyImplCopyWith<$Res> {
  __$$SchoolReadyImplCopyWithImpl(
      _$SchoolReadyImpl _value, $Res Function(_$SchoolReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objs = null,
  }) {
    return _then(_$SchoolReadyImpl(
      objs: null == objs
          ? _value._objs
          : objs // ignore: cast_nullable_to_non_nullable
              as Map<RegionEntity, List<SchoolEntity>>,
    ));
  }
}

/// @nodoc

class _$SchoolReadyImpl implements _SchoolReady {
  const _$SchoolReadyImpl(
      {required final Map<RegionEntity, List<SchoolEntity>> objs})
      : _objs = objs;

  final Map<RegionEntity, List<SchoolEntity>> _objs;
  @override
  Map<RegionEntity, List<SchoolEntity>> get objs {
    if (_objs is EqualUnmodifiableMapView) return _objs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_objs);
  }

  @override
  String toString() {
    return 'SchoolState.ready(objs: $objs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolReadyImpl &&
            const DeepCollectionEquality().equals(other._objs, _objs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_objs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolReadyImplCopyWith<_$SchoolReadyImpl> get copyWith =>
      __$$SchoolReadyImplCopyWithImpl<_$SchoolReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(Map<RegionEntity, List<SchoolEntity>> objs) ready,
  }) {
    return ready(objs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
  }) {
    return ready?.call(objs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(Map<RegionEntity, List<SchoolEntity>> objs)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(objs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SchoolLoading value) loading,
    required TResult Function(_SchoolErr value) err,
    required TResult Function(_SchoolReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SchoolLoading value)? loading,
    TResult? Function(_SchoolErr value)? err,
    TResult? Function(_SchoolReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SchoolLoading value)? loading,
    TResult Function(_SchoolErr value)? err,
    TResult Function(_SchoolReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _SchoolReady implements SchoolState {
  const factory _SchoolReady(
          {required final Map<RegionEntity, List<SchoolEntity>> objs}) =
      _$SchoolReadyImpl;

  Map<RegionEntity, List<SchoolEntity>> get objs;
  @JsonKey(ignore: true)
  _$$SchoolReadyImplCopyWith<_$SchoolReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
