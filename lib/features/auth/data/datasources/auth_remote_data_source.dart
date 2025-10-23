import 'package:coopdev/features/auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource{
  Future<UserModel> signUp(String email, String password, String name);
  Future<UserModel> login(String email, String password);
}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final http.Client client;
  final String baseUrl= "                      ";

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@test.com'&& password=='password') {
      return UserModel(id: '1', email: email, name: 'Test User', token: 'mock_jwt_token');
    }else{
      throw Exception('Invalid credential');
    }
  }

  @override
  Future<UserModel> signUp(String email, String password, String name) async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(id: DateTime.now().microsecondsSinceEpoch.toString(), email: email, name: name, token: 'mock_jwt_token');
  }

}