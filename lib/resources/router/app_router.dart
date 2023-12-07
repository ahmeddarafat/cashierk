import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/resources/service_locator/service_locator.dart';
import 'package:start_app/view/pages/auth/email_verification/email_verification_page.dart';
import 'package:start_app/view/pages/auth/login/login_page.dart';
import 'package:start_app/view/pages/auth/reset_password/reset_password_page.dart';
import 'package:start_app/view/pages/favourites/favourites_page.dart';
import 'package:start_app/view/pages/layouts/layouts_page.dart';
import 'package:start_app/view/pages/profile/change_passwored/change_password_page.dart';
import 'package:start_app/view/pages/profile/notification_settings/notificaiton_settings_page.dart';
import 'package:start_app/view/pages/recepits/order_details/order_details_page.dart';
import 'package:start_app/view/pages/scan/cart/cart_page.dart';
import 'package:start_app/view/pages/scan/order_state/order_state_page.dart';
import 'package:start_app/view_model/auth/login/login_cubit.dart';
import 'package:start_app/view_model/auth/register/register_cubit.dart';
import 'package:start_app/view_model/profile/change_password/change_password_cubit.dart';

import '../../view/pages/auth/forgot_password/forgot_password_page.dart';
import '../../view/pages/auth/register/register_page.dart';
import '../../view/pages/home/best_seller/best_seller.dart';
import '../../view/pages/home/categories/categories_page.dart';
import '../../view/pages/notifications/notifications_page.dart';
import '../../view/pages/profile/edit_profile/edit_profile_page.dart';
import '../../view/pages/search/search_page.dart';

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

  /// Scan
  static const cart = "cart";
  static const orderState = "order state";

  /// Recepits
  static const orderDetails = "order details";
  
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

      /// home
      case AppRoutes.layouts:
        return MaterialPageRoute(
          builder: (_) => const LayoutsPage(),
        );
      case AppRoutes.favourites:
        return MaterialPageRoute(
          builder: (_) => const FavouritesPage(),
        );

      /// Discover
      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => const CategoriesPage(),
        );
      case AppRoutes.bestSeller:
        return MaterialPageRoute(
          builder: (_) => const BestSellerPage(),
        );
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
        );
      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
        );

      /// Profile
      case AppRoutes.changePassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChangePasswordCubit(),
            child: const ChangePasswordPage(),
          ),
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      case AppRoutes.notificationSettings:
        return MaterialPageRoute(
          builder: (_) => const NotificationsSettingsPage(),
        );

      /// Cart
      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
        );
      case AppRoutes.orderState:
        return MaterialPageRoute(
          builder: (_) => OrderStatePage(
            isSuccess: routeSettings.arguments as bool,
          ),
        );

        /// Recepits
      case AppRoutes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => const OrderDetailsPage(),
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
