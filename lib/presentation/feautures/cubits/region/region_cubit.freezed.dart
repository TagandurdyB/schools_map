// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(List<RegionEntity> objs) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(List<RegionEntity> objs)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(List<RegionEntity> objs)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegionLoading value) loading,
    required TResult Function(_RegionErr value) err,
    required TResult Function(_RegionReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionLoading value)? loading,
    TResult? Function(_RegionErr value)? err,
    TResult? Function(_RegionReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionLoading value)? loading,
    TResult Function(_RegionErr value)? err,
    TResult Function(_RegionReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionStateCopyWith<$Res> {
  factory $RegionStateCopyWith(
          RegionState value, $Res Function(RegionState) then) =
      _$RegionStateCopyWithImpl<$Res, RegionState>;
}

/// @nodoc
class _$RegionStateCopyWithImpl<$Res, $Val extends RegionState>
    implements $RegionStateCopyWith<$Res> {
  _$RegionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegionLoadingImplCopyWith<$Res> {
  factory _$$RegionLoadingImplCopyWith(
          _$RegionLoadingImpl value, $Res Function(_$RegionLoadingImpl) then) =
      __$$RegionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegionLoadingImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionLoadingImpl>
    implements _$$RegionLoadingImplCopyWith<$Res> {
  __$$RegionLoadingImplCopyWithImpl(
      _$RegionLoadingImpl _value, $Res Function(_$RegionLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegionLoadingImpl implements _RegionLoading {
  const _$RegionLoadingImpl();

  @override
  String toString() {
    return 'RegionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(List<RegionEntity> objs) ready,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(List<RegionEntity> objs)? ready,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(List<RegionEntity> objs)? ready,
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
    required TResult Function(_RegionLoading value) loading,
    required TResult Function(_RegionErr value) err,
    required TResult Function(_RegionReady value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionLoading value)? loading,
    TResult? Function(_RegionErr value)? err,
    TResult? Function(_RegionReady value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionLoading value)? loading,
    TResult Function(_RegionErr value)? err,
    TResult Function(_RegionReady value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _RegionLoading implements RegionState {
  const factory _RegionLoading() = _$RegionLoadingImpl;
}

/// @nodoc
abstract class _$$RegionErrImplCopyWith<$Res> {
  factory _$$RegionErrImplCopyWith(
          _$RegionErrImpl value, $Res Function(_$RegionErrImpl) then) =
      __$$RegionErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic res});
}

/// @nodoc
class __$$RegionErrImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionErrImpl>
    implements _$$RegionErrImplCopyWith<$Res> {
  __$$RegionErrImplCopyWithImpl(
      _$RegionErrImpl _value, $Res Function(_$RegionErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? res = freezed,
  }) {
    return _then(_$RegionErrImpl(
      freezed == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$RegionErrImpl implements _RegionErr {
  const _$RegionErrImpl(this.res);

  @override
  final dynamic res;

  @override
  String toString() {
    return 'RegionState.err(res: $res)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionErrImpl &&
            const DeepCollectionEquality().equals(other.res, res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(res));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionErrImplCopyWith<_$RegionErrImpl> get copyWith =>
      __$$RegionErrImplCopyWithImpl<_$RegionErrImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(List<RegionEntity> objs) ready,
  }) {
    return err(res);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(List<RegionEntity> objs)? ready,
  }) {
    return err?.call(res);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(List<RegionEntity> objs)? ready,
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
    required TResult Function(_RegionLoading value) loading,
    required TResult Function(_RegionErr value) err,
    required TResult Function(_RegionReady value) ready,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionLoading value)? loading,
    TResult? Function(_RegionErr value)? err,
    TResult? Function(_RegionReady value)? ready,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionLoading value)? loading,
    TResult Function(_RegionErr value)? err,
    TResult Function(_RegionReady value)? ready,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _RegionErr implements RegionState {
  const factory _RegionErr(final dynamic res) = _$RegionErrImpl;

  dynamic get res;
  @JsonKey(ignore: true)
  _$$RegionErrImplCopyWith<_$RegionErrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegionReadyImplCopyWith<$Res> {
  factory _$$RegionReadyImplCopyWith(
          _$RegionReadyImpl value, $Res Function(_$RegionReadyImpl) then) =
      __$$RegionReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RegionEntity> objs});
}

/// @nodoc
class __$$RegionReadyImplCopyWithImpl<$Res>
    extends _$RegionStateCopyWithImpl<$Res, _$RegionReadyImpl>
    implements _$$RegionReadyImplCopyWith<$Res> {
  __$$RegionReadyImplCopyWithImpl(
      _$RegionReadyImpl _value, $Res Function(_$RegionReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objs = null,
  }) {
    return _then(_$RegionReadyImpl(
      objs: null == objs
          ? _value._objs
          : objs // ignore: cast_nullable_to_non_nullable
              as List<RegionEntity>,
    ));
  }
}

/// @nodoc

class _$RegionReadyImpl implements _RegionReady {
  const _$RegionReadyImpl({required final List<RegionEntity> objs})
      : _objs = objs;

  final List<RegionEntity> _objs;
  @override
  List<RegionEntity> get objs {
    if (_objs is EqualUnmodifiableListView) return _objs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objs);
  }

  @override
  String toString() {
    return 'RegionState.ready(objs: $objs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionReadyImpl &&
            const DeepCollectionEquality().equals(other._objs, _objs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_objs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionReadyImplCopyWith<_$RegionReadyImpl> get copyWith =>
      __$$RegionReadyImplCopyWithImpl<_$RegionReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic res) err,
    required TResult Function(List<RegionEntity> objs) ready,
  }) {
    return ready(objs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(dynamic res)? err,
    TResult? Function(List<RegionEntity> objs)? ready,
  }) {
    return ready?.call(objs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic res)? err,
    TResult Function(List<RegionEntity> objs)? ready,
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
    required TResult Function(_RegionLoading value) loading,
    required TResult Function(_RegionErr value) err,
    required TResult Function(_RegionReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegionLoading value)? loading,
    TResult? Function(_RegionErr value)? err,
    TResult? Function(_RegionReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegionLoading value)? loading,
    TResult Function(_RegionErr value)? err,
    TResult Function(_RegionReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _RegionReady implements RegionState {
  const factory _RegionReady({required final List<RegionEntity> objs}) =
      _$RegionReadyImpl;

  List<RegionEntity> get objs;
  @JsonKey(ignore: true)
  _$$RegionReadyImplCopyWith<_$RegionReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
