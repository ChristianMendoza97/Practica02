import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/theme/app_color_pallete.dart';
import 'package:flutter_application_2/features/authentification/presentation/pages/singup_page.dart';
import 'package:flutter_application_2/features/authentification/presentation/widgets/autenthication_field.dart';
import 'package:flutter_application_2/features/authentification/presentation/widgets/authentication_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static route()=> MaterialPageRoute(
    builder: (context)=>const LoginPage(),
    );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey= GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Text('Iniciar sesión',
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                 const SizedBox(height: 15,),
                 AutenthicationField(
                  hintText: 'Correo electrónico',
                  controller: emailController,),
                const SizedBox(height: 15,),
                  AutenthicationField(
                    hintText: 'Contraseña',
                    controller: passwordController,
                    isObscureText: true,),
            
                  const SizedBox(height: 20,),
                 AuthenticationGradientButton(
                  buttonText: 'Ingresar',
                  onPressed: (){},
                 ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        SignupPage.route(),
                      );
                    },
                    child: RichText(
                      text: TextSpan(text: '¿No tiene una cuenta?. ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Crear cuenta',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColorPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ]),
                    ),
                  ),
            
                ],
            ),
          ),
        ),
    );
  }
}
