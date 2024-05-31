abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpChangePasswordVisibility extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessfullyState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  String message;

  SignUpErrorState({required this.message});
}