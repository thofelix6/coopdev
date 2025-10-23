import 'package:coopdev/core/errors/failures.dart';
import 'package:coopdev/core/usecases/usecase.dart';
import 'package:coopdev/features/auth/domain/entities/user_entity.dart';
import 'package:coopdev/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParams>{
  final AuthRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failures, UserEntity>> call(LoginParams params) async{
    return await repository.login(params.email, params.password);
  }

}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}