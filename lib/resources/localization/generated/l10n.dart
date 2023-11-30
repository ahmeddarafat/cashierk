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

  /// `Welcome to the Cashierk App!`
  String get onboardingTitle1 {
    return Intl.message(
      'Welcome to the Cashierk App!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `This app will teach you everything you need to know about using the Cashierk, from setting it up to processing payments.`
  String get onboardingSubtitle1 {
    return Intl.message(
      'This app will teach you everything you need to know about using the Cashierk, from setting it up to processing payments.',
      name: 'onboardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Learn about the Cashierk`
  String get onboardingTitle2 {
    return Intl.message(
      'Learn about the Cashierk',
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

  /// `Get started with the Cashierk`
  String get onboardingTitle3 {
    return Intl.message(
      'Get started with the Cashierk',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `This app will walk you through the steps of getting started with the Cashierk, so you can start using it right away.`
  String get onboardingSubtitle3 {
    return Intl.message(
      'This app will walk you through the steps of getting started with the Cashierk, so you can start using it right away.',
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

  /// `Welcome to Cashierk!`
  String get registerTitle {
    return Intl.message(
      'Welcome to Cashierk!',
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

  /// `Enter the 4-digits code to verfiy your email address`
  String get otpSubtitle {
    return Intl.message(
      'Enter the 4-digits code to verfiy your email address',
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

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
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

  /// `Vegtables`
  String get vegtables {
    return Intl.message(
      'Vegtables',
      name: 'vegtables',
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
