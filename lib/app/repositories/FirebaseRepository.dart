
import 'package:Clinicarx/app/services/api.dart';

class FirebaseRepository {
  final _service = new ApiService();

  Future setTokenUser(String token) async {
    try{
      await _service.postRequest('app/firebasetoken',{"token": token});
      print("Token enviado");
    }catch(e) {}
    return true;
  }
}