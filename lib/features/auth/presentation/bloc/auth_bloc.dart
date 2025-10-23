import 'package:bloc/bloc.dart';
import 'package:coopdev/features/auth/domain/usecases/login_usecase.dart';
import 'package:coopdev/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUsecase signUpUsecase;
  AuthBloc({
    required this.loginUseCase,
    required this.signUpUsecase,
  }) : super(AuthInitial()){
    on<LoginEvent>(_onLoginEvent);
    on<SignUpEvent>(_onSignUpEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginUseCase(LoginParams(
        email: event.email,
        password: event.password)
    );

    result.fold(
      (failure)=>emit(AuthError(failure.message)),
      (user)=>emit(AuthAuthenticated(user)),
    );
  }

  void _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signUpUsecase(
      SignUpParams(
        email: event.email,
        password: event.password,
        name: event.name
      ),
    );

    result.fold(
          (failure)=>emit(AuthError(failure.message)),
          (user)=>emit(AuthAuthenticated(user)),
    );
  }
}
