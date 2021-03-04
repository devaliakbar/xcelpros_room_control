part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final String username;
  final String email;
  final String password;

  SignUpUserEvent(
      {@required this.username, @required this.email, @required this.password});

  @override
  List<Object> get props => [username, email, password];
}
