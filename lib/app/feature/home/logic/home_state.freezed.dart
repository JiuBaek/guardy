// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  bool get isActive => throw _privateConstructorUsedError;
  bool get safetyChecked => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get safetyLevel => throw _privateConstructorUsedError;
  String? get safetyDescription => throw _privateConstructorUsedError;
  List<HomeModel> get risks => throw _privateConstructorUsedError;

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isActive,
      bool safetyChecked,
      bool isLoading,
      String location,
      String? safetyLevel,
      String? safetyDescription,
      List<HomeModel> risks});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? safetyChecked = null,
    Object? isLoading = null,
    Object? location = null,
    Object? safetyLevel = freezed,
    Object? safetyDescription = freezed,
    Object? risks = null,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyChecked: null == safetyChecked
          ? _value.safetyChecked
          : safetyChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      safetyLevel: freezed == safetyLevel
          ? _value.safetyLevel
          : safetyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      safetyDescription: freezed == safetyDescription
          ? _value.safetyDescription
          : safetyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      risks: null == risks
          ? _value.risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isActive,
      bool safetyChecked,
      bool isLoading,
      String location,
      String? safetyLevel,
      String? safetyDescription,
      List<HomeModel> risks});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? safetyChecked = null,
    Object? isLoading = null,
    Object? location = null,
    Object? safetyLevel = freezed,
    Object? safetyDescription = freezed,
    Object? risks = null,
  }) {
    return _then(_$HomeStateImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyChecked: null == safetyChecked
          ? _value.safetyChecked
          : safetyChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      safetyLevel: freezed == safetyLevel
          ? _value.safetyLevel
          : safetyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      safetyDescription: freezed == safetyDescription
          ? _value.safetyDescription
          : safetyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      risks: null == risks
          ? _value._risks
          : risks // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {this.isActive = false,
      this.safetyChecked = false,
      this.isLoading = false,
      this.location = 'Unknown Place, Please wait a second',
      this.safetyLevel,
      this.safetyDescription,
      final List<HomeModel> risks = const []})
      : _risks = risks;

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool safetyChecked;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String location;
  @override
  final String? safetyLevel;
  @override
  final String? safetyDescription;
  final List<HomeModel> _risks;
  @override
  @JsonKey()
  List<HomeModel> get risks {
    if (_risks is EqualUnmodifiableListView) return _risks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_risks);
  }

  @override
  String toString() {
    return 'HomeState(isActive: $isActive, safetyChecked: $safetyChecked, isLoading: $isLoading, location: $location, safetyLevel: $safetyLevel, safetyDescription: $safetyDescription, risks: $risks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.safetyChecked, safetyChecked) ||
                other.safetyChecked == safetyChecked) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.safetyLevel, safetyLevel) ||
                other.safetyLevel == safetyLevel) &&
            (identical(other.safetyDescription, safetyDescription) ||
                other.safetyDescription == safetyDescription) &&
            const DeepCollectionEquality().equals(other._risks, _risks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isActive,
      safetyChecked,
      isLoading,
      location,
      safetyLevel,
      safetyDescription,
      const DeepCollectionEquality().hash(_risks));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(
      this,
    );
  }
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final bool isActive,
      final bool safetyChecked,
      final bool isLoading,
      final String location,
      final String? safetyLevel,
      final String? safetyDescription,
      final List<HomeModel> risks}) = _$HomeStateImpl;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  bool get isActive;
  @override
  bool get safetyChecked;
  @override
  bool get isLoading;
  @override
  String get location;
  @override
  String? get safetyLevel;
  @override
  String? get safetyDescription;
  @override
  List<HomeModel> get risks;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
