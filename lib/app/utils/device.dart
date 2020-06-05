import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceUtils {
  static Future<bool> isTheIosVersionCompatible(int targetVersion) async {
    if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      final version = iosInfo.systemVersion;

      if (int.parse(version) >= targetVersion) {
        return true;
      }
    }

    return false;
  }
}
