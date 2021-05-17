import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:room_control/core/error/failures.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/features/auth/domain/usecases/sign_up.dart';

part 'sign_up_state.dart';

class SignUpProvider extends ChangeNotifier {
  final PerformSignUp _performSignUp;
  SignUpState signUpState;

  SignUpProvider({@required PerformSignUp performSignUp})
      : assert(performSignUp != null),
        _performSignUp = performSignUp,
        signUpState = SignUpInitialState();

  Future<void> signUp(
      {@required String username,
      @required String email,
      @required String password}) async {
    signUpState = SignUpLoadingState();
    notifyListeners();

    final Either result = await _performSignUp(
      Params(username: username, email: email, password: password),
    );

    result.fold(
      (failure) {
        signUpState = SignUpErrorState(message: _mapFailureToMessage(failure));
        notifyListeners();
      },
      (success) {
        signUpState = SignUpSuccessState();
        notifyListeners();
      },
    );
  }

  void reset() {
    signUpState = SignUpInitialState();
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case IncorrectCredentialsFailure:
        return AppString.incorrectCredentials;

      case UsernameTakenFailure:
        return AppString.usernameTaken;

      default:
        return AppString.somethingWrong;
    }
  }
}
