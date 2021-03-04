import 'package:flutter/material.dart';
import 'package:room_control/core/error/exceptions.dart';
import 'package:room_control/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:room_control/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:room_control/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({@required this.remoteDataSource});
  @override
  Future<Either<Failure, bool>> login({String email, String password}) async {
    try {
      // LoginModel response =
      await remoteDataSource.login(email: email, password: password);
      // Store Token
      return Right(true);
    } on IncorrectCredentialsException {
      return Left(IncorrectCredentialsFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(
      {String username, String email, String password}) async {
    try {
      // AuthModel response =
      await remoteDataSource.signUp(
          username: username, email: email, password: password);
      // Store Token
      return Right(true);
    } on UsernameTakenException {
      return Left(UsernameTakenFailure());
    } catch (e) {
      return Left(UnExpectedFailure());
    }
  }
}
