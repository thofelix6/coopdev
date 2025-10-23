import 'package:coopdev/core/errors/failures.dart';
import 'package:coopdev/core/usecases/usecase.dart';
import 'package:coopdev/features/auth/domain/entities/user_entity.dart';
import 'package:coopdev/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUsecase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUsecase(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(SignUpParams params) async{
    return await authRepository.signUp(params.email, params.password, params.name);
  }


}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams({required this.email,
    required  this.password,
    required this.name
  });
}