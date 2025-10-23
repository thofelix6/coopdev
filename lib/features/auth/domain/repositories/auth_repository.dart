import 'package:coopdev/core/errors/failures.dart';
import 'package:coopdev/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserEntity>> signUp(String email, String password, String name);
  Future<Either<Failures, UserEntity>> login(String email, String password);
  Future<Either<Failures, void>> logout();
  Future<Either<Failures, UserEntity>> getCurrentUser();
  Future<Either<Failures, bool>> isLoggedIn();
}