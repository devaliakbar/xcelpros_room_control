import 'package:flutter/material.dart';
import 'package:room_control/core/error/exceptions.dart';
import 'package:room_control/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({@required String email, @required String password});
  Future<AuthModel> signUp(
      {@required String username,
      @required String email,
      @required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthModel> login({String email, String password}) async {
    //Connect with API

    await Future.delayed(Duration(seconds: 4));

    if (email == "ali" && password == "12345678") {
      return AuthModel();
    }

    ///IF Invalid Credentials , Throw [IncorrectCredentialsException]
    throw IncorrectCredentialsException();
  }

  @override
  Future<AuthModel> signUp(
      {String username, String email, String password}) async {
    //Connect with API
    await Future.delayed(Duration(seconds: 4));

    if (username == "ali") {
      ///IF Username taken , Throw [UsernameTakenException]
      throw UsernameTakenException();
    }

    return AuthModel();
  }
}
