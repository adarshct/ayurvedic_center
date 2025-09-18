import 'package:ayurvedic_center/core/utils/local_storage.dart';

class Auth {
  static String get accessToken => LocalStorage.getData(key: 'access') ?? "";
}
