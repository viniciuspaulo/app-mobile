import 'package:device_info/device_info.dart';

class DeviceUtils {
  static Future<bool> isIosVersionCompatible(int targetVersion) async {
    final iosInfo = await DeviceInfoPlugin().iosInfo;
    final version = iosInfo.systemVersion;

    return int.parse(version) >= targetVersion ? true : false;
  }
}
