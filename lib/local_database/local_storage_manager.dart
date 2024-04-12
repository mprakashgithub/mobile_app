import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_app/utils/utils.dart';

Future<void> writeLocalData<T>(String? key, dynamic value) async {
  try {
    if (key == null || value == null) {
      return;
    }
    var sharedPrefInstance = await SharedPreferences.getInstance();
    if (T == bool || value is bool) {
      await sharedPrefInstance.setBool(key, value);
    } else if (T == double || value is double) {
      await sharedPrefInstance.setDouble(key, value);
    } else if (T == int || value is int) {
      await sharedPrefInstance.setInt(key, value);
    } else if (T == String || value is String) {
      await sharedPrefInstance.setString(key, value);
    } else if (T == List || value is List<String>) {
      await sharedPrefInstance.setString(key, value);
    } else if (T == Map ||
        value is Map<String, dynamic> ||
        value is Map<String, Object>) {
      await sharedPrefInstance.setString(key, jsonEncode(value));
    }
  } catch (e) {
    log("writeLocalData", error: e);
  }
}

Future<T?> readLocalData<T>(String? key) async {
  try {
    if (key == null) {
      return null;
    }
    var sharedPrefInstance = await SharedPreferences.getInstance();
    dynamic data;
    switch (T) {
      case const (bool):
        data = sharedPrefInstance.get(key);
      case const (double):
        data = sharedPrefInstance.getDouble(key);
      case const (int):
        data = sharedPrefInstance.getInt(key);
      case const (String):
        data = sharedPrefInstance.getString(key);
      case const (Map<String, dynamic>):
      case const (Map<String, Object>):
        var result = sharedPrefInstance.get(key);
        if (result is String) {
          data = jsonCustomDecode(result);
        }
      case const (List):
        data = sharedPrefInstance.getStringList(key);
    }
    if (data != null) {
      return data as T;
    }
  } catch (e) {
    log("readLocalData", error: e);
    return null;
  }
  return null;
}

Future<bool> eraseLocalData() async {
  var sharedPrefInstance = await SharedPreferences.getInstance();
  return sharedPrefInstance.clear();
}

Future<void> deleteLocalData(String? key) async {
  if (key == null) {
    return;
  }
  var sharedPrefInstance = await SharedPreferences.getInstance();
  sharedPrefInstance.remove(key);
}
