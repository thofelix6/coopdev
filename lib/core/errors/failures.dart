import 'package:equatable/equatable.dart';
abstract class Failures extends Equatable{
  final String message;

  const Failures(this.message);
  @override
  List<Object> get props => [message];


}
class ServerFailure extends Failures{
  ServerFailure(super.message);
}

class CacheFailure extends Failures{
  CacheFailure(super.message);
}

class NetworkFailure extends Failures{
  NetworkFailure(super.message);
}