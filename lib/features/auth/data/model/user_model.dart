import 'package:coopdev/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String id;
  final String email;
  final String name;
  final String? token;

  UserModel({required this.id, required this.email, required this.name, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json['id'] ?? '', email: json['email'] ?? '', name: json['name'] ?? '', token: json['token']);
  }
  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'email':email,
      'name':name,
      'token':token,
    };
  }
  UserEntity toEntity(){
    return UserEntity(
      id:id,
      email:email,
      name:name,
      token:token,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, token];
}