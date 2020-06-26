import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes/domain/auth/auth_failure.dart';

import 'value_objects.dart';


abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassord({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassord({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

}