// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get nickname => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  int get birthYear => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String? get difficulties => throw _privateConstructorUsedError;
  String get emContactName => throw _privateConstructorUsedError;
  String get emContactNumber => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String nickname,
      String phoneNumber,
      String nationality,
      int birthYear,
      String language,
      String sex,
      String? difficulties,
      String emContactName,
      String emContactNumber});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? phoneNumber = null,
    Object? nationality = null,
    Object? birthYear = null,
    Object? language = null,
    Object? sex = null,
    Object? difficulties = freezed,
    Object? emContactName = null,
    Object? emContactNumber = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      birthYear: null == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      difficulties: freezed == difficulties
          ? _value.difficulties
          : difficulties // ignore: cast_nullable_to_non_nullable
              as String?,
      emContactName: null == emContactName
          ? _value.emContactName
          : emContactName // ignore: cast_nullable_to_non_nullable
              as String,
      emContactNumber: null == emContactNumber
          ? _value.emContactNumber
          : emContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String phoneNumber,
      String nationality,
      int birthYear,
      String language,
      String sex,
      String? difficulties,
      String emContactName,
      String emContactNumber});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? phoneNumber = null,
    Object? nationality = null,
    Object? birthYear = null,
    Object? language = null,
    Object? sex = null,
    Object? difficulties = freezed,
    Object? emContactName = null,
    Object? emContactNumber = null,
  }) {
    return _then(_$UserModelImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      birthYear: null == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      difficulties: freezed == difficulties
          ? _value.difficulties
          : difficulties // ignore: cast_nullable_to_non_nullable
              as String?,
      emContactName: null == emContactName
          ? _value.emContactName
          : emContactName // ignore: cast_nullable_to_non_nullable
              as String,
      emContactNumber: null == emContactNumber
          ? _value.emContactNumber
          : emContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.nickname,
      required this.phoneNumber,
      required this.nationality,
      required this.birthYear,
      required this.language,
      required this.sex,
      this.difficulties,
      required this.emContactName,
      required this.emContactNumber});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String nickname;
  @override
  final String phoneNumber;
  @override
  final String nationality;
  @override
  final int birthYear;
  @override
  final String language;
  @override
  final String sex;
  @override
  final String? difficulties;
  @override
  final String emContactName;
  @override
  final String emContactNumber;

  @override
  String toString() {
    return 'UserModel(nickname: $nickname, phoneNumber: $phoneNumber, nationality: $nationality, birthYear: $birthYear, language: $language, sex: $sex, difficulties: $difficulties, emContactName: $emContactName, emContactNumber: $emContactNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.difficulties, difficulties) ||
                other.difficulties == difficulties) &&
            (identical(other.emContactName, emContactName) ||
                other.emContactName == emContactName) &&
            (identical(other.emContactNumber, emContactNumber) ||
                other.emContactNumber == emContactNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      phoneNumber,
      nationality,
      birthYear,
      language,
      sex,
      difficulties,
      emContactName,
      emContactNumber);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String nickname,
      required final String phoneNumber,
      required final String nationality,
      required final int birthYear,
      required final String language,
      required final String sex,
      final String? difficulties,
      required final String emContactName,
      required final String emContactNumber}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get nickname;
  @override
  String get phoneNumber;
  @override
  String get nationality;
  @override
  int get birthYear;
  @override
  String get language;
  @override
  String get sex;
  @override
  String? get difficulties;
  @override
  String get emContactName;
  @override
  String get emContactNumber;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
