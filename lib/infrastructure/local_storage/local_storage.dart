import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_constants.dart';
import '../models/models.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  static String getToken() =>
      _preferences?.getString(AppConstants.keyToken) ?? '';

  static void _deleteToken() => _preferences?.remove(AppConstants.keyToken);

  static Future<void> setAddressSelected(AddressData data) async {
    if (_preferences != null) {
      await _preferences!.setString(
          AppConstants.keyAddressSelected, jsonEncode(data.toJson()));
    }
  }

  static AddressData? getAddressSelected() {
    String dataString =
        _preferences?.getString(AppConstants.keyAddressSelected) ?? "";
    if (dataString.isNotEmpty) {
      AddressData data = AddressData.fromJson(jsonDecode(dataString));
      return data;
    } else {
      return null;
    }
  }

  static void deleteAddressSelected() =>
      _preferences?.remove(AppConstants.keyAddressSelected);

  static Future<void> setBags(List<BagData> bags) async {
    if (_preferences != null) {
      final List<String> strings =
          bags.map((bag) => jsonEncode(bag.toJson())).toList();
      await _preferences!.setStringList(AppConstants.keyBags, strings);
    }
  }

  static List<BagData> getBags() {
    final List<String> bags =
        _preferences?.getStringList(AppConstants.keyBags) ?? [];
    final List<BagData> localBags = bags
        .map(
          (bag) => BagData.fromJson(jsonDecode(bag)),
        )
        .toList(growable: true);
    return localBags.isEmpty ? [BagData()] : localBags;
  }

  static void _deleteBags() => _preferences?.remove(AppConstants.keyBags);

  static Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  static List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  static Future<void> setOtherTranslations(
      {required Map<String, dynamic>? translations,
      required String key}) async {
    final preferences = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(translations);
    await preferences.setString(key, encoded);
  }

  static Future<Map<String, dynamic>> getOtherTranslations(
      {required String key}) async {
    final String encoded = _preferences?.getString(key) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static Future<void> setTranslations(
      Map<String, dynamic>? translations) async {
    final String encoded = jsonEncode(translations);
    await _preferences?.setString(AppConstants.keyTranslations, encoded);
  }

  static Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static deleteTranslations() =>
      _preferences?.remove(AppConstants.keyTranslations);

  static Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  static bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  static Future<void> setLanguageData(LanguageData? langData) async {
    final String lang = jsonEncode(langData?.toJson());
    await _preferences?.setString(AppConstants.keyLanguageData, lang);
  }

  static LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static Future<void> setLangLtr(bool? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward ?? false);
    }
  }

  static TextDirection getLangLtr({bool reverse = false}) {
    if (_preferences?.getBool(AppConstants.keyLangLtr) ?? false) {
      return reverse ? TextDirection.ltr : TextDirection.rtl;
    }

    return reverse ? TextDirection.rtl : TextDirection.ltr;
  }

  static Future<void> setSelectedCurrency(CurrencyData? currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency?.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  static CurrencyData? getSelectedCurrency() {
    final savedString =
        _preferences?.getString(AppConstants.keySelectedCurrency);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return CurrencyData.fromJson(map);
  }

  static Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  static UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void _deleteUser() => _preferences?.remove(AppConstants.keyUser);

  static Future<void> setShop(ShopData? shop) async {
    if (_preferences != null) {
      final String shopString = shop != null ? jsonEncode(shop.toJson()) : '';
      await _preferences!.setString(AppConstants.keyShop, shopString);
    }
  }

  static ShopData? getShop() {
    final savedString = _preferences?.getString(AppConstants.keyShop);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return ShopData.fromJson(map);
  }

  static void _deleteShop() => _preferences?.remove(AppConstants.keyShop);

  static void logout() {
    _deleteToken();
    _deleteUser();
    _deleteShop();
    _deleteBags();
  }
}
