import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:room_control/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(
      {@required String email, @required String password});
}
