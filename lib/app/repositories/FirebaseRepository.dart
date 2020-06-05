import 'package:Clinicarx/app/services/api.dart';

class FirebaseRepository {
  final _service = new ApiService();

  Future setTokenUser(String token) async {
    try {
      await _service.putRequest('profile/fcm-token', {"fcm_token": token});
    } catch (e) {}
    return true;
  }
}
