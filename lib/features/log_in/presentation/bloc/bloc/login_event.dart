part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class LoginRequest extends LoginEvent {
  final UserEntity entity;

  LoginRequest({required this.entity});

  
}