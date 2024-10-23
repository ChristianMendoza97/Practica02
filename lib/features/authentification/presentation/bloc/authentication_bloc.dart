import 'package:flutter/material.dart';
//import 'package:flutter_application_2/core/errors/failure.dart';
import 'package:flutter_application_2/features/authentification/domain/usecases/user_sign_up_usecase_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc 
extends Bloc<AuthenticationEvent, AuthenticationState> 
{
  final UserSignUpUsecaseImplementation _usecaseImplementation;


  AuthenticationBloc(
    {
      required UserSignUpUsecaseImplementation usecaseImplementation
    }
  ) : _usecaseImplementation =usecaseImplementation,

   super(AuthenticationInitialState()) {
    on<AuthenticationSignUpEvent>(
      (event, emit) async{
      final response = await _usecaseImplementation(
        UserSignUpCaseParams(
          name: event.name, 
          email: event.email, 
          password: event.password,
        ),
      );
      response.fold(
        (failure)=> emit(AuthenticationFailureState(failure.message)),
        (userId)=>emit(AuthenticationSuccessState(userId)));
    },
    );
  }
}
