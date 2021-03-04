import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:room_control/core/error/failures.dart';
import 'package:room_control/core/usecases/usecase.dart';
import 'package:room_control/features/auth/domain/repositories/auth_repository.dart';

class PerformLogin implements UseCase<bool, Params> {
  final AuthRepository authRepository;

  PerformLogin({@required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await authRepository.login(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
