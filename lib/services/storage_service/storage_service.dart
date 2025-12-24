import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _profileImageKey = 'profile_image_filename';

  const StorageService();

  Future<String?> read() async {
    final prefs = await SharedPreferences.getInstance();
    final fileName = prefs.getString(_profileImageKey);

    if (fileName != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fullPath = '${appDir.path}/$fileName';

      if (await File(fullPath).exists()) {
        return fullPath;
      }
    }
    return null;
  }

  Future<String> write(String sourcePath) async {
    final prefs = await SharedPreferences.getInstance();
    final appDir = await getApplicationDocumentsDirectory();

    final oldFileName = prefs.getString(_profileImageKey);
    if (oldFileName != null) {
      final oldFile = File('${appDir.path}/$oldFileName');
      if (await oldFile.exists()) {
        await oldFile.delete();
      }
    }

    final fileName = 'profile_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final permanentPath = '${appDir.path}/$fileName';

    await File(sourcePath).copy(permanentPath);
    await prefs.setString(_profileImageKey, fileName);

    return permanentPath;
  }

  Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    final fileName = prefs.getString(_profileImageKey);

    if (fileName != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final file = File('${appDir.path}/$fileName');
      if (await file.exists()) {
        await file.delete();
      }
    }

    await prefs.remove(_profileImageKey);
  }

  Future<void> clear() async {
    await delete();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
