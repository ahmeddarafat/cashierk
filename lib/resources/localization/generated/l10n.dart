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

  /// `------------ onbording -------------`
  String get onbording_comment {
    return Intl.message(
      '------------ onbording -------------',
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
