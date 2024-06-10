// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String PREFS_KEY_ONBOARDONG_VIEWED = "PREFS_KEY_ONBOARDONG_VIEWED";
const String PREFS_KEY_FIRST_SPLASH_VIEWED = "PREFS_KEY_FIRST_SPLASH_VIEWED";
const String PREFS_KEY_CURRENT_COUNTRY = "PREFS_KEY_CURRENT_COUNTRY";
const String PREFS_KEY_CURRENT_CURRENCY = "PREFS_KEY_CURRENT_CURRENCY";
const String DEFAULT_CURRENCY = "SAR";
// User Data
const String TOKEN = 'TOKEN';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<String> getCurrentCurrency() async {
    String? currentCurrency = _sharedPreferences.getString(PREFS_KEY_CURRENT_CURRENCY);
    if (currentCurrency != null && currentCurrency.isNotEmpty) {
      return currentCurrency;
    } else {
      return DEFAULT_CURRENCY;
    }
  }
  Future<void> setCurrentCurrency(String currentCurrency) async {
    _sharedPreferences.setString(PREFS_KEY_CURRENT_CURRENCY, currentCurrency);
  }

  Future<String> getCurrentCountry() async {
    String? currentCountry = _sharedPreferences.getString(PREFS_KEY_CURRENT_COUNTRY);
    if (currentCountry != null && currentCountry.isNotEmpty) {
      return currentCountry;
    } else {
      return "en";
    }
  }
  Future<void> setCurrentCountry(String currentCountry) async {
    _sharedPreferences.setString(PREFS_KEY_CURRENT_COUNTRY, currentCountry);
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      /// set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      /// set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }


  Future<void> customChangeAppLanguage(String language) async {
    _sharedPreferences.setString(PREFS_KEY_LANG, language);
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setUserLoggedIn(bool isLogin) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_LOGGED_IN, isLogin);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDONG_VIEWED, true);
  }

  Future<bool> getOnBoardingViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDONG_VIEWED) ?? false;
  }

  ///********** USER DATA SETTER & GETTER **********

  setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN, token);
  }

  getUserToken() {
    return _sharedPreferences.getString(TOKEN) ?? "";
  }

  // remove user data

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_LOGGED_IN);
    await _sharedPreferences.remove(TOKEN);

    // _sharedPreferences.clear();
  }
}
