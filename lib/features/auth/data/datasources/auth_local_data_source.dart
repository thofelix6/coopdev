import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(String userData);
  Future<String?> getCachedUser();
  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheUser(String userData) async{
    await sharedPreferences.setString('CACHED_USER', userData);
  }

  @override
  Future<void> clearCache() async{
    await sharedPreferences.remove('CACHED_USER');
  }

  @override
  Future<String?> getCachedUser() async{
    return sharedPreferences.getString('CACHED_USER');
  }

}