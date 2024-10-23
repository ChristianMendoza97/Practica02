import 'package:flutter_application_2/core/errors/failure.dart';
import 'package:flutter_application_2/features/authentification/domain/i_authentication_repository.dart';
import 'package:flutter_application_2/features/authentification/domain/usecases/i_usecase.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUpUsecaseImplementation implements 
IUseCase<String, UserSignUpCaseParams>{

    final IAuthenticationRepository iAuthenticationRepository;

    UserSignUpUsecaseImplementation(this. iAuthenticationRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpCaseParams params) 
  async {
    return await iAuthenticationRepository.signUpUpWithEmailPassword
    (name: params.name, email: params.email, password: params.email);
  }
  
}

class UserSignUpCaseParams {
  final String name;
  final String email;
  final String password;

  UserSignUpCaseParams(
    {
      required this.name, required this.email, required this.password
    }
  );

}