import 'package:roadapp/core/cach_helper/cache_vars.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._internal();

  // Private constructor for Singleton pattern
  CacheHelper._internal();

  // Factory constructor to return the same instance
  factory CacheHelper() {
    return _instance;
  }

  SharedPreferences? _prefs;

  // Initialize SharedPreferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveData(String key, dynamic value) async {
    if (_prefs == null) {
      throw Exception('CacheHelper not initialized');
    }

    if (value is String) {
      return _prefs!.setString(key, value);
    } else if (value is int) {
      return _prefs!.setInt(key, value);
    } else if (value is bool) {
      return _prefs!.setBool(key, value);
    } else if (value is double) {
      return _prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return _prefs!.setStringList(key, value);
    } else {
      // For complex data types, use Hive
      var box = await Hive.openBox('complexDataBox');
      try {
        box.put(key, value);
        return true;
      } catch (e) {
        // Handle any exceptions
        print('Error saving data in Hive: $e');
        return false;
      } finally {
        await box.close();
      }
    }
  }


  // Save simple data types using SharedPreferences
  // Future<bool> saveData(String key, dynamic value) async {
  //   if (_prefs == null) {
  //     throw Exception('CacheHelper not initialized');
  //   }

  //   if (value is String) {
  //     return _prefs!.setString(key, value);
  //   } else if (value is int) {
  //     return _prefs!.setInt(key, value);
  //   } else if (value is bool) {
  //     return _prefs!.setBool(key, value);
  //   } else if (value is double) {
  //     return _prefs!.setDouble(key, value);
  //   } else if (value is List<String>) {
  //     return _prefs!.setStringList(key, value);
  //   } else {
  //     // For complex data types, use Hive
  //     var box = await Hive.openBox('complexDataBox');
  //     try {
  //       box.put(key, value);
  //       return true;
  //     } catch (e) {
  //       // Handle any exceptions
  //       print('Error saving data in Hive: $e');
  //       return false;
  //     } finally {
  //       await box.close();
  //     }
  //   }
  // }

  // Retrieve data
  dynamic getData(String key) {
    if (_prefs == null) {
      throw Exception('CacheHelper not initialized');
    }

    var value = _prefs!.get(key);
    if (value != null) {
      return value;
    } else {
      // Check in Hive for complex data
      try {
        var box = Hive.box('complexDataBox');
        return box.get(key);
      } catch (e) {
        // Handle any exceptions
        print('Error retrieving data from Hive: $e');
        return null;
      }
    }
  }

  // Delete data
  Future<bool> removeData(String key) async {
    if (_prefs == null) {
      throw Exception('CacheHelper not initialized');
    }

    if (_prefs!.containsKey(key)) {
      return _prefs!.remove(key);
    } else {
      // Remove from Hive if exists
      try {
        var box = Hive.box('complexDataBox');
        if (box.containsKey(key)) {
          box.delete(key);
          return true;
        }
        return false;
      } catch (e) {
        // Handle any exceptions
        print('Error deleting data from Hive: $e');
        return false;
      }
    }
  }
}
