import 'package:shared_preferences/shared_preferences.dart';

class UserProfile {
  final String name;
  final String nbi;
  final String email;
  final String alamat;
  final String instagram;

  const UserProfile({
    required this.name,
    required this.nbi,
    this.email = '',
    this.alamat = '',
    this.instagram = '',
  });
}

class UserStorage {
  static const _nameKey = 'registered_name';
  static const _nbiKey = 'registered_nbi';
  static const _emailKey = 'registered_email';
  static const _alamatKey = 'registered_alamat';
  static const _instagramKey = 'registered_instagram';
  static const _pinKey = 'registered_pin';
  static const _defaultName = 'Farrel Pramuditya Nugroho';
  static const _defaultNbi = '1462300172';

  static Future<void> saveProfile({
    required String name,
    required String nbi,
    required String email,
    required String alamat,
    required String instagram,
    required String pin,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name.trim());
    await prefs.setString(_nbiKey, nbi.trim());
    await prefs.setString(_emailKey, email.trim());
    await prefs.setString(_alamatKey, alamat.trim());
    await prefs.setString(_instagramKey, instagram.trim());
    await prefs.setString(_pinKey, pin.trim());
  }

  static Future<UserProfile> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final nbi = prefs.getString(_nbiKey);
    final email = prefs.getString(_emailKey);
    final alamat = prefs.getString(_alamatKey);
    final instagram = prefs.getString(_instagramKey);

    return UserProfile(
      name: name == null || name.isEmpty ? _defaultName : name,
      nbi: nbi == null || nbi.isEmpty ? _defaultNbi : nbi,
      email: email ?? '',
      alamat: alamat ?? '',
      instagram: instagram ?? '',
    );
  }

  static Future<bool> hasProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final nbi = prefs.getString(_nbiKey);

    return name != null && name.isNotEmpty && nbi != null && nbi.isNotEmpty;
  }

  static Future<bool> verifyPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    final savedPin = prefs.getString(_pinKey);
    final savedNbi = prefs.getString(_nbiKey);
    final expectedPin =
        savedPin == null || savedPin.isEmpty ? savedNbi : savedPin;

    return expectedPin != null && pin.trim() == expectedPin;
  }
}
