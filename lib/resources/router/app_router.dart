import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/resources/service_locator/service_locator.dart';
import 'package:start_app/view/pages/auth/email_verification/email_verification_page.dart';
import 'package:start_app/view/pages/auth/login/login_page.dart';
import 'package:start_app/view/pages/auth/reset_password/reset_password_page.dart';
import 'package:start_app/view_model/auth/login/login_cubit.dart';
import 'package:start_app/view_model/auth/register/register_cubit.dart';

import '../../view/pages/auth/forgot_password/forgot_password_page.dart';
import '../../view/pages/auth/register/register_page.dart';

class AppRoutes {
  AppRoutes._private();

  /// Auth
  static const login = "login";
  static const register = "register";
  static const forgotPassword = "forgot password";
  static const emailVerify = "email verify";
  static const resetPassword = "reset password";

  /// home
  static const layouts = "layouts";
  
}

class RouteGenerate {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      /// Auth
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(getIt()),
            child: const LoginPage(),
          ),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(getIt()),
            child: const RegisterPage(),
          ),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
        );
      case AppRoutes.emailVerify:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationPage(),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => _undfinedPage(route: routeSettings.name),
        );
    }
  }

  static Scaffold _undfinedPage({String? route}) {
    return Scaffold(
      appBar: AppBar(title: const Text("Undfined Page")),
      body: Center(child: Text("${route ?? "Undifined"} Page")),
    );
  }
}
