import 'package:equatable/equatable.dart';

class UseEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? token;


  const UseEntity({
    required this.id,
    required this.name,
    required this.email,
    this.token
  });

  @override

  List<Object?> get props => [id, name, email, token];
}