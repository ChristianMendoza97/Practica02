import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/secrets/app_secrets.dart';
import 'package:flutter_application_2/core/theme/app_theme.dart';
import 'package:flutter_application_2/features/authentification/data/datasources/i_authentication_remote_data_source.dart';
import 'package:flutter_application_2/features/authentification/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_application_2/features/authentification/domain/usecases/user_sign_up_usecase_implementation.dart';
import 'package:flutter_application_2/features/authentification/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_application_2/features/authentification/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//AM2025@@

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonkey,);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create:(_)=> AuthenticationBloc(
          usecaseImplementation: UserSignUpUsecaseImplementation(
           AuthenticationRepositoryImplementation(
            AuthenticationRemoteDataSoureImplementation(
              supabase.client,
            )
           ) 
          ))),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

