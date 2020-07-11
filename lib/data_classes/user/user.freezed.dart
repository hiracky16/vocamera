// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserTearOff {
  const _$UserTearOff();

  _User call({FirebaseUser firebaseUser, String word}) {
    return _User(
      firebaseUser: firebaseUser,
      word: word,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  FirebaseUser get firebaseUser;
  String get word;

  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({FirebaseUser firebaseUser, String word});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object firebaseUser = freezed,
    Object word = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as FirebaseUser,
      word: word == freezed ? _value.word : word as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({FirebaseUser firebaseUser, String word});
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
    Object word = freezed,
  }) {
    return _then(_User(
      firebaseUser: firebaseUser == freezed
          ? _value.firebaseUser
          : firebaseUser as FirebaseUser,
      word: word == freezed ? _value.word : word as String,
    ));
  }
}

class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User({this.firebaseUser, this.word});

  @override
  final FirebaseUser firebaseUser;
  @override
  final String word;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(firebaseUser: $firebaseUser, word: $word)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('firebaseUser', firebaseUser))
      ..add(DiagnosticsProperty('word', word));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.firebaseUser, firebaseUser) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseUser, firebaseUser)) &&
            (identical(other.word, word) ||
                const DeepCollectionEquality().equals(other.word, word)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firebaseUser) ^
      const DeepCollectionEquality().hash(word);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User({FirebaseUser firebaseUser, String word}) = _$_User;

  @override
  FirebaseUser get firebaseUser;
  @override
  String get word;
  @override
  _$UserCopyWith<_User> get copyWith;
}
