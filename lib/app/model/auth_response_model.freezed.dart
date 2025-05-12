// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  bool? get success => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  int get birthYear => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String? get difficulties => throw _privateConstructorUsedError;
  String get emContactName => throw _privateConstructorUsedError;
  String get emContactNumber => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call(
      {bool? success,
      String? token,
      String nickname,
      String phoneNumber,
      String nationality,
      int birthYear,
      String language,
      String sex,
      String? difficulties,
      String emContactName,
      String emContactNumber,
      String fcmToken});
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? token = freezed,
    Object? nickname = null,
    Object? phoneNumber = null,
    Object? nationality = null,
    Object? birthYear = null,
    Object? language = null,
    Object? sex = null,
    Object? difficulties = freezed,
    Object? emContactName = null,
    Object? emContactNumber = null,
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
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
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthResponseModelImplCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$AuthResponseModelImplCopyWith(_$AuthResponseModelImpl value,
          $Res Function(_$AuthResponseModelImpl) then) =
      __$$AuthResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? token,
      String nickname,
      String phoneNumber,
      String nationality,
      int birthYear,
      String language,
      String sex,
      String? difficulties,
      String emContactName,
      String emContactNumber,
      String fcmToken});
}

/// @nodoc
class __$$AuthResponseModelImplCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$AuthResponseModelImpl>
    implements _$$AuthResponseModelImplCopyWith<$Res> {
  __$$AuthResponseModelImplCopyWithImpl(_$AuthResponseModelImpl _value,
      $Res Function(_$AuthResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? token = freezed,
    Object? nickname = null,
    Object? phoneNumber = null,
    Object? nationality = null,
    Object? birthYear = null,
    Object? language = null,
    Object? sex = null,
    Object? difficulties = freezed,
    Object? emContactName = null,
    Object? emContactNumber = null,
    Object? fcmToken = null,
  }) {
    return _then(_$AuthResponseModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
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
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseModelImpl implements _AuthResponseModel {
  const _$AuthResponseModelImpl(
      {required this.success,
      required this.token,
      required this.nickname,
      required this.phoneNumber,
      required this.nationality,
      required this.birthYear,
      required this.language,
      required this.sex,
      this.difficulties,
      required this.emContactName,
      required this.emContactNumber,
      required this.fcmToken});

  factory _$AuthResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseModelImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? token;
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
  final String fcmToken;

  @override
  String toString() {
    return 'AuthResponseModel(success: $success, token: $token, nickname: $nickname, phoneNumber: $phoneNumber, nationality: $nationality, birthYear: $birthYear, language: $language, sex: $sex, difficulties: $difficulties, emContactName: $emContactName, emContactNumber: $emContactNumber, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.token, token) || other.token == token) &&
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
                other.emContactNumber == emContactNumber) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      token,
      nickname,
      phoneNumber,
      nationality,
      birthYear,
      language,
      sex,
      difficulties,
      emContactName,
      emContactNumber,
      fcmToken);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      __$$AuthResponseModelImplCopyWithImpl<_$AuthResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final bool? success,
      required final String? token,
      required final String nickname,
      required final String phoneNumber,
      required final String nationality,
      required final int birthYear,
      required final String language,
      required final String sex,
      final String? difficulties,
      required final String emContactName,
      required final String emContactNumber,
      required final String fcmToken}) = _$AuthResponseModelImpl;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$AuthResponseModelImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get token;
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
  @override
  String get fcmToken;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
