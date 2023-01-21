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

  /// `Splash View`
  String get splash_view {
    return Intl.message(
      'Splash View',
      name: 'splash_view',
      desc: '',
      args: [],
    );
  }

  /// `Chef Management`
  String get chef_management {
    return Intl.message(
      'Chef Management',
      name: 'chef_management',
      desc: '',
      args: [],
    );
  }

  /// `Chef list not found`
  String get user_not_found {
    return Intl.message(
      'Chef list not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Language Choose`
  String get language_chose {
    return Intl.message(
      'Language Choose',
      name: 'language_chose',
      desc: '',
      args: [],
    );
  }

  /// `Türkçe`
  String get change_tr {
    return Intl.message(
      'Türkçe',
      name: 'change_tr',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get change_en {
    return Intl.message(
      'English',
      name: 'change_en',
      desc: '',
      args: [],
    );
  }

  /// `Add New Chef`
  String get add_new_chef {
    return Intl.message(
      'Add New Chef',
      name: 'add_new_chef',
      desc: '',
      args: [],
    );
  }

  /// `Delete Chef`
  String get delete_chef {
    return Intl.message(
      'Delete Chef',
      name: 'delete_chef',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the chef?`
  String get delete_chef_confirm {
    return Intl.message(
      'Are you sure you want to delete the chef?',
      name: 'delete_chef_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
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

  /// `Operation Successfully`
  String get operation_successfully {
    return Intl.message(
      'Operation Successfully',
      name: 'operation_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message(
      'Surname',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birth_date {
    return Intl.message(
      'Birth Date',
      name: 'birth_date',
      desc: '',
      args: [],
    );
  }

  /// `Identity`
  String get identity {
    return Intl.message(
      'Identity',
      name: 'identity',
      desc: '',
      args: [],
    );
  }

  /// `Sallary`
  String get sallary {
    return Intl.message(
      'Sallary',
      name: 'sallary',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get required {
    return Intl.message(
      'This field is required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid TC number`
  String get tckn_invalid {
    return Intl.message(
      'Enter valid TC number',
      name: 'tckn_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Chef Information`
  String get chef_information {
    return Intl.message(
      'Chef Information',
      name: 'chef_information',
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
      Locale.fromSubtags(languageCode: 'tr'),
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
