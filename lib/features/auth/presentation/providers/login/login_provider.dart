import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:room_control/core/error/failures.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/features/auth/domain/usecases/login.dart';

part 'login_state.dart';

class LoginProvider extends ChangeNotifier {
  final PerformLogin _performLogin;
  LoginState loginState;

  LoginProvider({@required PerformLogin performLogin})
      : assert(performLogin != null),
        _performLogin = performLogin,
        loginState = LoginInitialState();

  Future<void> login(
      {@required String email, @required String password}) async {
    loginState = LoginLoadingState();
    notifyListeners();

    final Either result = await _performLogin(
      Params(email: email, password: password),
    );

    result.fold(
      (failure) {
        loginState = LoginErrorState(message: _mapFailureToMessage(failure));
        notifyListeners();
      },
      (success) {
        loginState = LoginSuccessState();
        notifyListeners();
      },
    );
  }

  void reset() {
    loginState = LoginInitialState();
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case IncorrectCredentialsFailure:
        return AppString.incorrectCredentials;
      default:
        return AppString.somethingWrong;
    }
  }
}
