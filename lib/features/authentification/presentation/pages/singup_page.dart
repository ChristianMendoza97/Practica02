import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/theme/app_color_pallete.dart';
import 'package:flutter_application_2/features/authentification/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_application_2/features/authentification/presentation/pages/login_page.dart';
import 'package:flutter_application_2/features/authentification/presentation/widgets/autenthication_field.dart';
import 'package:flutter_application_2/features/authentification/presentation/widgets/authentication_gradient_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Crear una cuenta',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              AutenthicationField(
                hintText: 'Nombre',
                controller: nameController,
              ),
              const SizedBox(height: 15),
              AutenthicationField(
                hintText: 'Correo electrónico',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AutenthicationField(
                hintText: 'Contraseña',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthenticationGradientButton(
                buttonText: 'Registrar',
                onPressed: () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthenticationBloc>().add(
                            AuthenticationSignUpEvent(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuario creado'),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al crear el usuario: ${e.toString()}'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    LoginPage.route(),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: '¿Tiene una cuenta?. ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Iniciar sesión',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: AppColorPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
