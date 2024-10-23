import 'package:flutter_application_2/core/errors/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IAuthenticationRemoteDataSource {
  Future<String> signUpUpWithEmailPassword ({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthenticationRemoteDataSoureImplementation
implements IAuthenticationRemoteDataSource {

  final SupabaseClient supabaseClient;

  AuthenticationRemoteDataSoureImplementation(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({
    required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpUpWithEmailPassword(
    {required String name,
     required String email, 
     required String password}) async {
    try {
      
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          name: name,
        },
      );

      if (response.user == null) {
        throw const ServerException('El usuario no se puedo crear, el userId es null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
  
}