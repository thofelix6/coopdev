import 'dart:convert';

import 'package:coopdev/core/errors/failures.dart';
import 'package:coopdev/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:coopdev/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:coopdev/features/auth/data/model/user_model.dart';
import 'package:coopdev/features/auth/domain/entities/user_entity.dart';
import 'package:coopdev/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async{
    try{
      final userJson = await authLocalDataSource.getCachedUser();
      if(userJson != null){
        final userModel = UserModel.fromJson(json.decode(userJson));
        return Right(userModel.toEntity());
      }
      return Left(CacheFailure('No User Found'));
    } catch (e){
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> isLoggedIn() async{
    try{
      final userJson = await authLocalDataSource.getCachedUser();
      return Right(userJson != null);
    }catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) async{
    try{
      final userModel = await authRemoteDataSource.login(email, password);
      await authLocalDataSource.cacheUser(json.encode(userModel.toJson()));
      return Right(userModel.toEntity());
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> logout() async{
    try{
      await authLocalDataSource.clearCache();
      return Right(null);
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signUp(String email, String password, String name) async{
    try{
      final  userModel = await authRemoteDataSource.signUp(email, password, name);
      await authLocalDataSource.cacheUser(json.encode(userModel.toJson()));
      return Right(userModel.toEntity());
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}