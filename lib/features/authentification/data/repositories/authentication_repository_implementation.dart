import 'package:flutter_application_2/core/errors/exceptions.dart';
import 'package:flutter_application_2/core/errors/failure.dart';
import 'package:flutter_application_2/features/authentification/data/datasources/i_authentication_remote_data_source.dart';
import 'package:flutter_application_2/features/authentification/domain/i_authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticationRepositoryImplementation 
implements IAuthenticationRepository {

    final IAuthenticationRemoteDataSource iAuthenticationRemoteDataSource;

    const AuthenticationRepositoryImplementation(this.iAuthenticationRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
    {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpUpWithEmailPassword(
    {required String name, required String email, 
    required String password}) async{
    try {
      final userId=
      await iAuthenticationRemoteDataSource.signUpUpWithEmailPassword(
        name: name, email: email, password: password);
        return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}