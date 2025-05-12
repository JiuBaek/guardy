// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'risk_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RiskItemModel _$RiskItemModelFromJson(Map<String, dynamic> json) {
  return _RiskItemModel.fromJson(json);
}

/// @nodoc
mixin _$RiskItemModel {
  String get location => throw _privateConstructorUsedError;
  int get safetyLevel => throw _privateConstructorUsedError;
  List<RiskDetail> get detail => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this RiskItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskItemModelCopyWith<RiskItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskItemModelCopyWith<$Res> {
  factory $RiskItemModelCopyWith(
          RiskItemModel value, $Res Function(RiskItemModel) then) =
      _$RiskItemModelCopyWithImpl<$Res, RiskItemModel>;
  @useResult
  $Res call(
      {String location,
      int safetyLevel,
      List<RiskDetail> detail,
      String summary});
}

/// @nodoc
class _$RiskItemModelCopyWithImpl<$Res, $Val extends RiskItemModel>
    implements $RiskItemModelCopyWith<$Res> {
  _$RiskItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? safetyLevel = null,
    Object? detail = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      safetyLevel: null == safetyLevel
          ? _value.safetyLevel
          : safetyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<RiskDetail>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiskItemModelImplCopyWith<$Res>
    implements $RiskItemModelCopyWith<$Res> {
  factory _$$RiskItemModelImplCopyWith(
          _$RiskItemModelImpl value, $Res Function(_$RiskItemModelImpl) then) =
      __$$RiskItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String location,
      int safetyLevel,
      List<RiskDetail> detail,
      String summary});
}

/// @nodoc
class __$$RiskItemModelImplCopyWithImpl<$Res>
    extends _$RiskItemModelCopyWithImpl<$Res, _$RiskItemModelImpl>
    implements _$$RiskItemModelImplCopyWith<$Res> {
  __$$RiskItemModelImplCopyWithImpl(
      _$RiskItemModelImpl _value, $Res Function(_$RiskItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RiskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? safetyLevel = null,
    Object? detail = null,
    Object? summary = null,
  }) {
    return _then(_$RiskItemModelImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      safetyLevel: null == safetyLevel
          ? _value.safetyLevel
          : safetyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<RiskDetail>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskItemModelImpl implements _RiskItemModel {
  _$RiskItemModelImpl(
      {required this.location,
      required this.safetyLevel,
      required final List<RiskDetail> detail,
      required this.summary})
      : _detail = detail;

  factory _$RiskItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskItemModelImplFromJson(json);

  @override
  final String location;
  @override
  final int safetyLevel;
  final List<RiskDetail> _detail;
  @override
  List<RiskDetail> get detail {
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  @override
  final String summary;

  @override
  String toString() {
    return 'RiskItemModel(location: $location, safetyLevel: $safetyLevel, detail: $detail, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskItemModelImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.safetyLevel, safetyLevel) ||
                other.safetyLevel == safetyLevel) &&
            const DeepCollectionEquality().equals(other._detail, _detail) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location, safetyLevel,
      const DeepCollectionEquality().hash(_detail), summary);

  /// Create a copy of RiskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskItemModelImplCopyWith<_$RiskItemModelImpl> get copyWith =>
      __$$RiskItemModelImplCopyWithImpl<_$RiskItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskItemModelImplToJson(
      this,
    );
  }
}

abstract class _RiskItemModel implements RiskItemModel {
  factory _RiskItemModel(
      {required final String location,
      required final int safetyLevel,
      required final List<RiskDetail> detail,
      required final String summary}) = _$RiskItemModelImpl;

  factory _RiskItemModel.fromJson(Map<String, dynamic> json) =
      _$RiskItemModelImpl.fromJson;

  @override
  String get location;
  @override
  int get safetyLevel;
  @override
  List<RiskDetail> get detail;
  @override
  String get summary;

  /// Create a copy of RiskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskItemModelImplCopyWith<_$RiskItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskDetail _$RiskDetailFromJson(Map<String, dynamic> json) {
  return _RiskDetail.fromJson(json);
}

/// @nodoc
mixin _$RiskDetail {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this RiskDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskDetailCopyWith<RiskDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskDetailCopyWith<$Res> {
  factory $RiskDetailCopyWith(
          RiskDetail value, $Res Function(RiskDetail) then) =
      _$RiskDetailCopyWithImpl<$Res, RiskDetail>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$RiskDetailCopyWithImpl<$Res, $Val extends RiskDetail>
    implements $RiskDetailCopyWith<$Res> {
  _$RiskDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiskDetailImplCopyWith<$Res>
    implements $RiskDetailCopyWith<$Res> {
  factory _$$RiskDetailImplCopyWith(
          _$RiskDetailImpl value, $Res Function(_$RiskDetailImpl) then) =
      __$$RiskDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$RiskDetailImplCopyWithImpl<$Res>
    extends _$RiskDetailCopyWithImpl<$Res, _$RiskDetailImpl>
    implements _$$RiskDetailImplCopyWith<$Res> {
  __$$RiskDetailImplCopyWithImpl(
      _$RiskDetailImpl _value, $Res Function(_$RiskDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of RiskDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$RiskDetailImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskDetailImpl implements _RiskDetail {
  _$RiskDetailImpl({required this.title, required this.content});

  factory _$RiskDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskDetailImplFromJson(json);

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'RiskDetail(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  /// Create a copy of RiskDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskDetailImplCopyWith<_$RiskDetailImpl> get copyWith =>
      __$$RiskDetailImplCopyWithImpl<_$RiskDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskDetailImplToJson(
      this,
    );
  }
}

abstract class _RiskDetail implements RiskDetail {
  factory _RiskDetail(
      {required final String title,
      required final String content}) = _$RiskDetailImpl;

  factory _RiskDetail.fromJson(Map<String, dynamic> json) =
      _$RiskDetailImpl.fromJson;

  @override
  String get title;
  @override
  String get content;

  /// Create a copy of RiskDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskDetailImplCopyWith<_$RiskDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
