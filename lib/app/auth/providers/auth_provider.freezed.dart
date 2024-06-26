// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthStateInitial initial() {
    return const _AuthStateInitial();
  }

  _AuthStateError error(String error) {
    return _AuthStateError(
      error,
    );
  }

  _AuthStateLoading loading() {
    return const _AuthStateLoading();
  }

  _AuthStateMagicLinkSent magicLinkSent() {
    return const _AuthStateMagicLinkSent();
  }

  _AuthStateAuthenticated authenticated(sb.User user) {
    return _AuthStateAuthenticated(
      user,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$AuthStateInitialCopyWith<$Res> {
  factory _$AuthStateInitialCopyWith(
          _AuthStateInitial value, $Res Function(_AuthStateInitial) then) =
      __$AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateInitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateInitialCopyWith<$Res> {
  __$AuthStateInitialCopyWithImpl(
      _AuthStateInitial _value, $Res Function(_AuthStateInitial) _then)
      : super(_value, (v) => _then(v as _AuthStateInitial));

  @override
  _AuthStateInitial get _value => super._value as _AuthStateInitial;
}

/// @nodoc

class _$_AuthStateInitial extends _AuthStateInitial
    with DiagnosticableTreeMixin {
  const _$_AuthStateInitial() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthStateInitial extends AuthState {
  const factory _AuthStateInitial() = _$_AuthStateInitial;
  const _AuthStateInitial._() : super._();
}

/// @nodoc
abstract class _$AuthStateErrorCopyWith<$Res> {
  factory _$AuthStateErrorCopyWith(
          _AuthStateError value, $Res Function(_AuthStateError) then) =
      __$AuthStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$AuthStateErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateErrorCopyWith<$Res> {
  __$AuthStateErrorCopyWithImpl(
      _AuthStateError _value, $Res Function(_AuthStateError) _then)
      : super(_value, (v) => _then(v as _AuthStateError));

  @override
  _AuthStateError get _value => super._value as _AuthStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_AuthStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthStateError extends _AuthStateError with DiagnosticableTreeMixin {
  const _$_AuthStateError(this.error) : super._();

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$AuthStateErrorCopyWith<_AuthStateError> get copyWith =>
      __$AuthStateErrorCopyWithImpl<_AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStateError extends AuthState {
  const factory _AuthStateError(String error) = _$_AuthStateError;
  const _AuthStateError._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$AuthStateErrorCopyWith<_AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthStateLoadingCopyWith<$Res> {
  factory _$AuthStateLoadingCopyWith(
          _AuthStateLoading value, $Res Function(_AuthStateLoading) then) =
      __$AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateLoadingCopyWith<$Res> {
  __$AuthStateLoadingCopyWithImpl(
      _AuthStateLoading _value, $Res Function(_AuthStateLoading) _then)
      : super(_value, (v) => _then(v as _AuthStateLoading));

  @override
  _AuthStateLoading get _value => super._value as _AuthStateLoading;
}

/// @nodoc

class _$_AuthStateLoading extends _AuthStateLoading
    with DiagnosticableTreeMixin {
  const _$_AuthStateLoading() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
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
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoading extends AuthState {
  const factory _AuthStateLoading() = _$_AuthStateLoading;
  const _AuthStateLoading._() : super._();
}

/// @nodoc
abstract class _$AuthStateMagicLinkSentCopyWith<$Res> {
  factory _$AuthStateMagicLinkSentCopyWith(_AuthStateMagicLinkSent value,
          $Res Function(_AuthStateMagicLinkSent) then) =
      __$AuthStateMagicLinkSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateMagicLinkSentCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateMagicLinkSentCopyWith<$Res> {
  __$AuthStateMagicLinkSentCopyWithImpl(_AuthStateMagicLinkSent _value,
      $Res Function(_AuthStateMagicLinkSent) _then)
      : super(_value, (v) => _then(v as _AuthStateMagicLinkSent));

  @override
  _AuthStateMagicLinkSent get _value => super._value as _AuthStateMagicLinkSent;
}

/// @nodoc

class _$_AuthStateMagicLinkSent extends _AuthStateMagicLinkSent
    with DiagnosticableTreeMixin {
  const _$_AuthStateMagicLinkSent() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.magicLinkSent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.magicLinkSent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthStateMagicLinkSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) {
    return magicLinkSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) {
    return magicLinkSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
    required TResult orElse(),
  }) {
    if (magicLinkSent != null) {
      return magicLinkSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) {
    return magicLinkSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) {
    return magicLinkSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (magicLinkSent != null) {
      return magicLinkSent(this);
    }
    return orElse();
  }
}

abstract class _AuthStateMagicLinkSent extends AuthState {
  const factory _AuthStateMagicLinkSent() = _$_AuthStateMagicLinkSent;
  const _AuthStateMagicLinkSent._() : super._();
}

/// @nodoc
abstract class _$AuthStateAuthenticatedCopyWith<$Res> {
  factory _$AuthStateAuthenticatedCopyWith(_AuthStateAuthenticated value,
          $Res Function(_AuthStateAuthenticated) then) =
      __$AuthStateAuthenticatedCopyWithImpl<$Res>;
  $Res call({sb.User user});
}

/// @nodoc
class __$AuthStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateAuthenticatedCopyWith<$Res> {
  __$AuthStateAuthenticatedCopyWithImpl(_AuthStateAuthenticated _value,
      $Res Function(_AuthStateAuthenticated) _then)
      : super(_value, (v) => _then(v as _AuthStateAuthenticated));

  @override
  _AuthStateAuthenticated get _value => super._value as _AuthStateAuthenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_AuthStateAuthenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as sb.User,
    ));
  }
}

/// @nodoc

class _$_AuthStateAuthenticated extends _AuthStateAuthenticated
    with DiagnosticableTreeMixin {
  const _$_AuthStateAuthenticated(this.user) : super._();

  @override
  final sb.User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthStateAuthenticated &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$AuthStateAuthenticatedCopyWith<_AuthStateAuthenticated> get copyWith =>
      __$AuthStateAuthenticatedCopyWithImpl<_AuthStateAuthenticated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function() loading,
    required TResult Function() magicLinkSent,
    required TResult Function(sb.User user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function()? loading,
    TResult Function()? magicLinkSent,
    TResult Function(sb.User user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateInitial value) initial,
    required TResult Function(_AuthStateError value) error,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateMagicLinkSent value) magicLinkSent,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateInitial value)? initial,
    TResult Function(_AuthStateError value)? error,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateMagicLinkSent value)? magicLinkSent,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthStateAuthenticated extends AuthState {
  const factory _AuthStateAuthenticated(sb.User user) =
      _$_AuthStateAuthenticated;
  const _AuthStateAuthenticated._() : super._();

  sb.User get user;
  @JsonKey(ignore: true)
  _$AuthStateAuthenticatedCopyWith<_AuthStateAuthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}
