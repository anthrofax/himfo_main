import 'package:get_storage/get_storage.dart';
import 'package:himtika_apps/app/routes/app_pages.dart';
import 'package:himtika_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import '../providers/auth_provider.dart';

class AuthListener<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() async {
    if (mounted) {
      providerContainer.read(AuthProvider.provider.notifier).setInitial();

      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onAuthenticated(Session session) async {
    if (mounted) {
      providerContainer
          .read(AuthProvider.provider.notifier)
          .setAuthenticated(session.user!);
      final box = GetStorage();
      box.write("email", Supabase.instance.client.auth.session()!.user!.email);
      Future.delayed(const Duration(seconds: 2), () => "2");
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onErrorAuthenticating(String message) {
    if (mounted) {
      providerContainer.read(AuthProvider.provider.notifier).setError(message);
    }
  }

  @override
  void onPasswordRecovery(Session session) {
    throw UnimplementedError();
  }
}
