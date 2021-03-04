import 'package:flutter/material.dart';
import 'package:room_control/core/error/exceptions.dart';
import 'package:room_control/features/auth/data/models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({@required String email, @required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<LoginModel> login({String email, String password}) async {
    try {
      //Connect with API
      ///IF Invalid Credentials , Throw [IncorrectCredentialsFailure]
      await Future.delayed(Duration(seconds: 4));
      return LoginModel();
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
