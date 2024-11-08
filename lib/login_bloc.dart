// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  // Define the function that handles the event when login is pressed
  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2)); 

    if (event.email == 'user@example.com' && event.password == 'password123') {
      emit(LoginInitial()); 
    } else {
      emit(LoginFailure(error: 'Invalid email or password'));
    }
  }
}