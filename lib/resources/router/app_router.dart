import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/data/models/order_entity.dart';
import 'package:start_app/data/repository/scan_repository.dart';
import 'package:start_app/resources/service_locator/service_locator.dart';
import 'package:start_app/view/pages/auth/email_verification/email_verification_page.dart';
import 'package:start_app/view/pages/auth/login/login_page.dart';
import 'package:start_app/view/pages/auth/reset_password/reset_password_page.dart';
import 'package:start_app/view/pages/favourites/favourites_page.dart';
import 'package:start_app/view/pages/layouts/layouts_page.dart';
import 'package:start_app/view/pages/onboarding/onboarding_page.dart';
import 'package:start_app/view/pages/payment/payment_webview.dart';
import 'package:start_app/view/pages/profile/change_passwored/change_password_page.dart';
import 'package:start_app/view/pages/profile/notification_settings/notificaiton_settings_page.dart';
import 'package:start_app/view/pages/profile/policy_terms/about_Page.dart';
import 'package:start_app/view/pages/profile/policy_terms/policy_page.dart';
import 'package:start_app/view/pages/recepits/order_details/order_details_page.dart';
import 'package:start_app/view/pages/scan/cart/cart_page.dart';
import 'package:start_app/view/pages/scan/order_state/order_state_page.dart';
import 'package:start_app/view/pages/scan/qr_view/qr_view_page.dart';
import 'package:start_app/view/pages/scan/waiting/waiting_page.dart';
import 'package:start_app/view_model/auth/register/register_cubit.dart';
import 'package:start_app/view_model/profile/change_password/change_password_cubit.dart';
import 'package:start_app/view_model/scan/cart/cart_viewmodel.dart';
import 'package:start_app/view_model/scan/qr_code/qr_bloc.dart';
import 'package:start_app/view_model/scan/waiting/wating_viewmodel.dart';

import '../../view/pages/auth/forgot_password/forgot_password_page.dart';
import '../../view/pages/auth/register/register_page.dart';
import '../../view/pages/home/best_seller/best_seller.dart';
import '../../view/pages/home/categories/categories_page.dart';
import '../../view/pages/notifications/notifications_page.dart';
import '../../view/pages/profile/edit_profile/edit_profile_page.dart';
import '../../view/pages/profile/policy_terms/terms_page.dart';
import '../../view/pages/search/search_page.dart';

class AppRoutes {
  AppRoutes._private();

  /// Auth
  static const onboarding = "onboarding";
  static const login = "login";
  static const register = "register";
  static const forgotPassword = "forgot password";
  static const emailVerify = "email verify";
  static const resetPassword = "reset password";

  /// home
  static const layouts = "layouts";
  static const favourites = "favourites";

  /// Discover
  static const categories = "categories";
  static const bestSeller = "best seller";
  static const search = "search";
  static const notifications = "notifications";

  /// profile
  static const editProfile = "edit profile";
  static const myOrders = "my orders";
  static const myCards = "my cards";
  static const about = "about";
  static const notificationSettings = "notification settings";
  static const helpCenter = "help center";
  static const changePassword = "change password";
  static const policy = "policy";
  static const terms = "terms";

  /// Scan
  static const cart = "cart";
  static const orderStatus = "order state";
  static const qrView = "qr view";
  static const waiting = "waiting";

  /// Recepits
  static const orderDetails = "order details";

  /// payment
  static const payment = "payment";
}

class RouteGenerate {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      /// Auth
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
          settings: routeSettings,
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: routeSettings,
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RegisterCubit(getIt()),
            child: const RegisterPage(),
          ),
          settings: routeSettings,
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
          settings: routeSettings,
        );
      case AppRoutes.emailVerify:
        return MaterialPageRoute(
          builder: (_) => EmailVerificationPage(),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordPage(),
          settings: routeSettings,
        );

      /// home
      case AppRoutes.layouts:
        return MaterialPageRoute(
          builder: (_) => const LayoutsPage(),
          settings: routeSettings,
        );
      case AppRoutes.favourites:
        return MaterialPageRoute(
          builder: (_) => const FavouritesPage(),
          settings: routeSettings,
        );

      /// Discover
      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => const CategoriesPage(),
          settings: routeSettings,
        );
      case AppRoutes.bestSeller:
        return MaterialPageRoute(
          builder: (_) => const BestSellerPage(),
          settings: routeSettings,
        );
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: routeSettings,
        );
      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
          settings: routeSettings,
        );

      /// Profile
      case AppRoutes.changePassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChangePasswordCubit(),
            child: const ChangePasswordPage(),
          ),
          settings: routeSettings,
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
          settings: routeSettings,
        );
      case AppRoutes.notificationSettings:
        return MaterialPageRoute(
          builder: (_) => const NotificationsSettingsPage(),
          settings: routeSettings,
        );
      case AppRoutes.policy:
        return MaterialPageRoute(
          builder: (_) => const PolicyPage(),
          settings: routeSettings,
        );
      case AppRoutes.terms:
        return MaterialPageRoute(
          builder: (_) => const TermsPage(),
          settings: routeSettings,
        );
      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (_) => const AboutPage(),
          settings: routeSettings,
        );

      /// Scan
      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CartViewModel(getIt()),
            child: CartPage(order: routeSettings.arguments as OrderEntity),
          ),
          settings: routeSettings,
        );
      case AppRoutes.qrView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => QRBloc(getIt<ScanRepository>()),
            child: const QRViewPage(),
          ),
          settings: routeSettings,
        );
      case AppRoutes.orderStatus:
        return MaterialPageRoute(
          builder: (_) => OrderStatePage(
            isSuccess: routeSettings.arguments as bool,
          ),
          settings: routeSettings,
        );
      case AppRoutes.waiting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => WaitingViewModel(getIt<ScanRepository>()),
            child: const WaitingPage(),
          ),
          settings: routeSettings,
        );

      /// Recepits
      case AppRoutes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsPage(
            order: routeSettings.arguments as OrderEntity,
          ),
          settings: routeSettings,
        );

      /// Payment
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (_) => PaymentWebView(
            paymentToken: routeSettings.arguments as String,
          ),
          settings: routeSettings,
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
