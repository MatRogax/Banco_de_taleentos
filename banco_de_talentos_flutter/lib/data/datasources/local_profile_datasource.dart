import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_model.dart';

@lazySingleton
class LocalProfileDatasource {
  static const _profileKey = 'cached_profile';

  Future<void> cacheProfile(ProfileModel profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileKey, jsonEncode(profile.toJson()));
  }

  Future<ProfileModel?> getLastProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_profileKey);
    if (jsonStr != null) {
      try {
        final decodedMap = jsonDecode(jsonStr) as Map<String, dynamic>;
        return ProfileModel.fromJson(decodedMap);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileKey);
  }
}
