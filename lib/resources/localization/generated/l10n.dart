// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `--------------------------- onbording -------------------------------`
  String get onbording_comment {
    return Intl.message(
      '--------------------------- onbording -------------------------------',
      name: 'onbording_comment',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Cashierc App!`
  String get onboardingTitle1 {
    return Intl.message(
      'Welcome to the Cashierc App!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `This app will teach you everything you need to know about using the Cashierc, from setting it up to processing payments.`
  String get onboardingSubtitle1 {
    return Intl.message(
      'This app will teach you everything you need to know about using the Cashierc, from setting it up to processing payments.',
      name: 'onboardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Learn about the Cashierc`
  String get onboardingTitle2 {
    return Intl.message(
      'Learn about the Cashierc',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `In this app, you'll learn about the features of the AI Cashier and how to use them to your advantage.`
  String get onboardingSubtitle2 {
    return Intl.message(
      'In this app, you\'ll learn about the features of the AI Cashier and how to use them to your advantage.',
      name: 'onboardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Get started with the Cashierc`
  String get onboardingTitle3 {
    return Intl.message(
      'Get started with the Cashierc',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `This app will walk you through the steps of getting started with the Cashierc, so you can start using it right away.`
  String get onboardingSubtitle3 {
    return Intl.message(
      'This app will walk you through the steps of getting started with the Cashierc, so you can start using it right away.',
      name: 'onboardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- login -------------------------------`
  String get login_comment {
    return Intl.message(
      '--------------------------- login -------------------------------',
      name: 'login_comment',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue!`
  String get loginTitle {
    return Intl.message(
      'Login to continue!',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Please, enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a valid email`
  String get invalidEmailMeg {
    return Intl.message(
      'Please, enter a valid email',
      name: 'invalidEmailMeg',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Please, enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a valid password`
  String get invalidPasswordMeg {
    return Intl.message(
      'Please, enter a valid password',
      name: 'invalidPasswordMeg',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- register -------------------------------`
  String get register_comment {
    return Intl.message(
      '--------------------------- register -------------------------------',
      name: 'register_comment',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Please, accept terms & policy`
  String get acceptTermsErrorMessage {
    return Intl.message(
      'Please, accept terms & policy',
      name: 'acceptTermsErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Cashierc!`
  String get registerTitle {
    return Intl.message(
      'Welcome to Cashierc!',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your first name`
  String get enterFirstName {
    return Intl.message(
      'Please, enter your first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your Last name`
  String get enterLastName {
    return Intl.message(
      'Please, enter your Last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password again`
  String get confirmPassHint {
    return Intl.message(
      'Enter your password again',
      name: 'confirmPassHint',
      desc: '',
      args: [],
    );
  }

  /// `Password is not match`
  String get notMatchPassMeg {
    return Intl.message(
      'Password is not match',
      name: 'notMatchPassMeg',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your phone number`
  String get phoneHint {
    return Intl.message(
      'Please, enter your phone number',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number is not valid`
  String get invalidPhone {
    return Intl.message(
      'Your phone number is not valid',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please, select a profile image`
  String get profileImageErrorMessage {
    return Intl.message(
      'Please, select a profile image',
      name: 'profileImageErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- forgot_passwrd -------------------------------`
  String get forgot_passwrd_comment {
    return Intl.message(
      '--------------------------- forgot_passwrd -------------------------------',
      name: 'forgot_passwrd_comment',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter you email address to can change your password`
  String get forgetPasswordSubtitle {
    return Intl.message(
      'Enter you email address to can change your password',
      name: 'forgetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- otp -------------------------------`
  String get otp_comment {
    return Intl.message(
      '--------------------------- otp -------------------------------',
      name: 'otp_comment',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get otpTitle {
    return Intl.message(
      'Email Verification',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digits code to verfiy your email address`
  String get otpSubtitle {
    return Intl.message(
      'Enter the 6-digits code to verfiy your email address',
      name: 'otpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Verfiy`
  String get verify {
    return Intl.message(
      'Verfiy',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- reset_passwrd -------------------------------`
  String get reset_passwrd_comment {
    return Intl.message(
      '--------------------------- reset_passwrd -------------------------------',
      name: 'reset_passwrd_comment',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the new password`
  String get resetPasswordSubtitle {
    return Intl.message(
      'Enter the new password',
      name: 'resetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- Discover -------------------------------`
  String get discover_comment {
    return Intl.message(
      '--------------------------- Discover -------------------------------',
      name: 'discover_comment',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get WelcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'WelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Fruits`
  String get fruits {
    return Intl.message(
      'Fruits',
      name: 'fruits',
      desc: '',
      args: [],
    );
  }

  /// `Vegetables`
  String get vegetables {
    return Intl.message(
      'Vegetables',
      name: 'vegetables',
      desc: '',
      args: [],
    );
  }

  /// `Meat`
  String get meat {
    return Intl.message(
      'Meat',
      name: 'meat',
      desc: '',
      args: [],
    );
  }

  /// `Chicken`
  String get chicken {
    return Intl.message(
      'Chicken',
      name: 'chicken',
      desc: '',
      args: [],
    );
  }

  /// `Orange`
  String get orange {
    return Intl.message(
      'Orange',
      name: 'orange',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get bestSeller {
    return Intl.message(
      'Best Seller',
      name: 'bestSeller',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- Notifications -------------------------------`
  String get notification_comment {
    return Intl.message(
      '--------------------------- Notifications -------------------------------',
      name: 'notification_comment',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- favourites -------------------------------`
  String get favourites_comment {
    return Intl.message(
      '--------------------------- favourites -------------------------------',
      name: 'favourites_comment',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an favorite items yet`
  String get noFavoriteTitle {
    return Intl.message(
      'You don\'t have an favorite items yet',
      name: 'noFavoriteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remember to mark you favorite items`
  String get noFavoriteSubtitle {
    return Intl.message(
      'Remember to mark you favorite items',
      name: 'noFavoriteSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- profile -------------------------------`
  String get profile_comment {
    return Intl.message(
      '--------------------------- profile -------------------------------',
      name: 'profile_comment',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `My Cards`
  String get myCards {
    return Intl.message(
      'My Cards',
      name: 'myCards',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutWarning {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutWarning',
      desc: '',
      args: [],
    );
  }

  /// `Yes, logout`
  String get yesLogout {
    return Intl.message(
      'Yes, logout',
      name: 'yesLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Digital platform that integrates artificial intelligence (AI) technology into the operations and customer experience of a supermarket. This app employs various AI algorithms and tools to enhance different aspects of the supermarket, including inventory management, personalized shopping experiences, dynamic pricing, checkout optimization, predictive analytics, and customer service. By leveraging AI capabilities, the app aims to improve efficiency, convenience, and customer satisfaction while also optimizing inventory, reducing waste, and maximizing profitability for the supermarket. Overall, a 'Smart Supermarket with AI' app revolutionizes the traditional supermarket model by introducing advanced technology solutions to streamline operations and enhance the shopping experience for both customers and store operators.`
  String get aboutDescription {
    return Intl.message(
      'Digital platform that integrates artificial intelligence (AI) technology into the operations and customer experience of a supermarket. This app employs various AI algorithms and tools to enhance different aspects of the supermarket, including inventory management, personalized shopping experiences, dynamic pricing, checkout optimization, predictive analytics, and customer service. By leveraging AI capabilities, the app aims to improve efficiency, convenience, and customer satisfaction while also optimizing inventory, reducing waste, and maximizing profitability for the supermarket. Overall, a \'Smart Supermarket with AI\' app revolutionizes the traditional supermarket model by introducing advanced technology solutions to streamline operations and enhance the shopping experience for both customers and store operators.',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- notifications settings -------------------------------`
  String get notification_settings_comment {
    return Intl.message(
      '--------------------------- notifications settings -------------------------------',
      name: 'notification_settings_comment',
      desc: '',
      args: [],
    );
  }

  /// `General Notifications`
  String get generalNotifications {
    return Intl.message(
      'General Notifications',
      name: 'generalNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers`
  String get specialOffer {
    return Intl.message(
      'Special Offers',
      name: 'specialOffer',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememeberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememeberMe',
      desc: '',
      args: [],
    );
  }

  /// `App Updates`
  String get appUpdates {
    return Intl.message(
      'App Updates',
      name: 'appUpdates',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- change_password -------------------------------`
  String get change_password_comment {
    return Intl.message(
      '--------------------------- change_password -------------------------------',
      name: 'change_password_comment',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the field below to change your current password.`
  String get changePasswordSubtitle {
    return Intl.message(
      'Please fill in the field below to change your current password.',
      name: 'changePasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `*********`
  String get passStars {
    return Intl.message(
      '*********',
      name: 'passStars',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- Scan -------------------------------`
  String get scan_comment {
    return Intl.message(
      '--------------------------- Scan -------------------------------',
      name: 'scan_comment',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR Code`
  String get scanTitle {
    return Intl.message(
      'Scan the QR Code',
      name: 'scanTitle',
      desc: '',
      args: [],
    );
  }

  /// `Point Your Camera Towards the QR Code to receive the voucher`
  String get scanSubtitle {
    return Intl.message(
      'Point Your Camera Towards the QR Code to receive the voucher',
      name: 'scanSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan Now`
  String get scanNow {
    return Intl.message(
      'Scan Now',
      name: 'scanNow',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- cart -------------------------------`
  String get cart_comment {
    return Intl.message(
      '--------------------------- cart -------------------------------',
      name: 'cart_comment',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get taxes {
    return Intl.message(
      'Taxes',
      name: 'taxes',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to checkout`
  String get proceedCheckout {
    return Intl.message(
      'Proceed to checkout',
      name: 'proceedCheckout',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- order state -------------------------------`
  String get order_state_comment {
    return Intl.message(
      '--------------------------- order state -------------------------------',
      name: 'order_state_comment',
      desc: '',
      args: [],
    );
  }

  /// `Order Successful`
  String get orderSuccessful {
    return Intl.message(
      'Order Successful',
      name: 'orderSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Your items has been placed and is on it’s way to being processed`
  String get orderSuccessfulSubtitle {
    return Intl.message(
      'Your items has been placed and is on it’s way to being processed',
      name: 'orderSuccessfulSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Order Failed`
  String get orderFaild {
    return Intl.message(
      'Oops! Order Failed',
      name: 'orderFaild',
      desc: '',
      args: [],
    );
  }

  /// `Something went terribly wrong`
  String get orderFaildSubtitle {
    return Intl.message(
      'Something went terribly wrong',
      name: 'orderFaildSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Track my Order`
  String get trackMyOrder {
    return Intl.message(
      'Track my Order',
      name: 'trackMyOrder',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message(
      'Back to Home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- receptis -------------------------------`
  String get recepits_comment {
    return Intl.message(
      '--------------------------- receptis -------------------------------',
      name: 'recepits_comment',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an order yet`
  String get noOrderTitle {
    return Intl.message(
      'You don\'t have an order yet',
      name: 'noOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any order at this time`
  String get noOrderSubtitle {
    return Intl.message(
      'You don\'t have any order at this time',
      name: 'noOrderSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- order detials comment -------------------------------`
  String get order_details_comment {
    return Intl.message(
      '--------------------------- order detials comment -------------------------------',
      name: 'order_details_comment',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get OrderStatus {
    return Intl.message(
      'Order Status',
      name: 'OrderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Order OverView`
  String get overview {
    return Intl.message(
      'Order OverView',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get orderId {
    return Intl.message(
      'Order ID',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `Shop Name`
  String get shopName {
    return Intl.message(
      'Shop Name',
      name: 'shopName',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- waiting comment -------------------------------`
  String get Wating_comment {
    return Intl.message(
      '--------------------------- waiting comment -------------------------------',
      name: 'Wating_comment',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait`
  String get pleaseWait {
    return Intl.message(
      'Please Wait',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `We are adding your products`
  String get waitingSubtitle {
    return Intl.message(
      'We are adding your products',
      name: 'waitingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `--------------------------- notifications comment -------------------------------`
  String get notifications_comment {
    return Intl.message(
      '--------------------------- notifications comment -------------------------------',
      name: 'notifications_comment',
      desc: '',
      args: [],
    );
  }

  /// `You don't have notifications yet`
  String get noNotificationsTitle {
    return Intl.message(
      'You don\'t have notifications yet',
      name: 'noNotificationsTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
