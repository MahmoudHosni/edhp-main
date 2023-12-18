abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessfullyState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({
    required this.error,
  });
}

class LoginChangePasswordVisibility extends LoginStates {}

class LoginChangeRememberMeState extends LoginStates {}