// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserTearOff {
  const _$UserTearOff();

  _User call({FirebaseUser firebaseUser}) {
    return _User(
      firebaseUser: firebaseUser,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  FirebaseUser get firebaseUser;

  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({FirebaseUser firebaseUser});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object firebaseUser = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as FirebaseUser,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({FirebaseUser firebaseUser});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object firebaseUser = freezed,
  }) {
    return _then(_User(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as FirebaseUser,
    ));
  }
}

class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User({this.firebaseUser});

  @override
  final FirebaseUser firebaseUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(firebaseUser: $firebaseUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('firebaseUser', firebaseUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.firebaseUser, firebaseUser) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseUser, firebaseUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(firebaseUser);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User({FirebaseUser firebaseUser}) = _$_User;

  @override
  FirebaseUser get firebaseUser;
  @override
  _$UserCopyWith<_User> get copyWith;
}
