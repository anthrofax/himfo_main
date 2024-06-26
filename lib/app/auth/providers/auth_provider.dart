import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase/supabase.dart' as sb;
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.error(String error) = _AuthStateError;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.magicLinkSent() = _AuthStateMagicLinkSent;
  const factory AuthState.authenticated(sb.User user) = _AuthStateAuthenticated;
}

class AuthProvider extends StateNotifier<AuthState> {
  final sb.GoTrueClient _client;

  static final provider = StateNotifierProvider<AuthProvider, AuthState>(
    (ref) => AuthProvider(
      const AuthState.initial(),
      Supabase.instance.client.auth,
    ),
  );

  AuthProvider(AuthState state, this._client) : super(state);

  void setAuthenticated(sb.User user) {
    state = AuthState.authenticated(user);
  }

  void setInitial() {
    state = const AuthState.initial();
  }

  void setError(String error) {
    state = AuthState.error(error);
  }

  void setLoading() {
    state = const AuthState.loading();
  }

  void setMagicLinkSent() {
    state = const AuthState.magicLinkSent();
  }

  Future<void> sendMagicLink(String email) async {
    setLoading();

    final res = await _client.signIn(
      email: email,
      options: sb.AuthOptions(
        redirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback',
      ),
    );

    if (res.error != null) {
      setError(res.error!.message);
    } else {
      setMagicLinkSent();
    }
  }
}
