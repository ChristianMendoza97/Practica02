import 'package:flutter_application_2/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IAuthenticationRepository {
  Future<Either<Failure, String>> signUpUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  });

}