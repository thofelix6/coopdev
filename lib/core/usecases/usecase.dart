import 'package:coopdev/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failures, Type>> call (Params params);
}

class NoParams{

}