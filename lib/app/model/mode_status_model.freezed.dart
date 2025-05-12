// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mode_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModeStatusModel _$ModeStatusModelFromJson(Map<String, dynamic> json) {
  return _ModeStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ModeStatusModel {
  String get mode => throw _privateConstructorUsedError;
  int? get safetyStage => throw _privateConstructorUsedError;
  String? get lastCheckinTime => throw _privateConstructorUsedError;

  /// Serializes this ModeStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModeStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModeStatusModelCopyWith<ModeStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModeStatusModelCopyWith<$Res> {
  factory $ModeStatusModelCopyWith(
          ModeStatusModel value, $Res Function(ModeStatusModel) then) =
      _$ModeStatusModelCopyWithImpl<$Res, ModeStatusModel>;
  @useResult
  $Res call({String mode, int? safetyStage, String? lastCheckinTime});
}

/// @nodoc
class _$ModeStatusModelCopyWithImpl<$Res, $Val extends ModeStatusModel>
    implements $ModeStatusModelCopyWith<$Res> {
  _$ModeStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModeStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? safetyStage = freezed,
    Object? lastCheckinTime = freezed,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      safetyStage: freezed == safetyStage
          ? _value.safetyStage
          : safetyStage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCheckinTime: freezed == lastCheckinTime
          ? _value.lastCheckinTime
          : lastCheckinTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModeStatusModelImplCopyWith<$Res>
    implements $ModeStatusModelCopyWith<$Res> {
  factory _$$ModeStatusModelImplCopyWith(_$ModeStatusModelImpl value,
          $Res Function(_$ModeStatusModelImpl) then) =
      __$$ModeStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, int? safetyStage, String? lastCheckinTime});
}

/// @nodoc
class __$$ModeStatusModelImplCopyWithImpl<$Res>
    extends _$ModeStatusModelCopyWithImpl<$Res, _$ModeStatusModelImpl>
    implements _$$ModeStatusModelImplCopyWith<$Res> {
  __$$ModeStatusModelImplCopyWithImpl(
      _$ModeStatusModelImpl _value, $Res Function(_$ModeStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModeStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? safetyStage = freezed,
    Object? lastCheckinTime = freezed,
  }) {
    return _then(_$ModeStatusModelImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      safetyStage: freezed == safetyStage
          ? _value.safetyStage
          : safetyStage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCheckinTime: freezed == lastCheckinTime
          ? _value.lastCheckinTime
          : lastCheckinTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModeStatusModelImpl implements _ModeStatusModel {
  _$ModeStatusModelImpl(
      {required this.mode, this.safetyStage, this.lastCheckinTime});

  factory _$ModeStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModeStatusModelImplFromJson(json);

  @override
  final String mode;
  @override
  final int? safetyStage;
  @override
  final String? lastCheckinTime;

  @override
  String toString() {
    return 'ModeStatusModel(mode: $mode, safetyStage: $safetyStage, lastCheckinTime: $lastCheckinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModeStatusModelImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.safetyStage, safetyStage) ||
                other.safetyStage == safetyStage) &&
            (identical(other.lastCheckinTime, lastCheckinTime) ||
                other.lastCheckinTime == lastCheckinTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mode, safetyStage, lastCheckinTime);

  /// Create a copy of ModeStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModeStatusModelImplCopyWith<_$ModeStatusModelImpl> get copyWith =>
      __$$ModeStatusModelImplCopyWithImpl<_$ModeStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModeStatusModelImplToJson(
      this,
    );
  }
}

abstract class _ModeStatusModel implements ModeStatusModel {
  factory _ModeStatusModel(
      {required final String mode,
      final int? safetyStage,
      final String? lastCheckinTime}) = _$ModeStatusModelImpl;

  factory _ModeStatusModel.fromJson(Map<String, dynamic> json) =
      _$ModeStatusModelImpl.fromJson;

  @override
  String get mode;
  @override
  int? get safetyStage;
  @override
  String? get lastCheckinTime;

  /// Create a copy of ModeStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModeStatusModelImplCopyWith<_$ModeStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
