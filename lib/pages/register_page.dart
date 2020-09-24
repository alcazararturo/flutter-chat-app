import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_label.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/services/auth_service.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLogo(titulo: 'Register'),
                _Form(),
                CustomLabel(
                    msg: '¿Ya tienes cuenta?',
                    text: 'Ingresa con tu cuenta',
                    ruta: 'login'),
                Text('Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final namelController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Name',
            keyboardType: TextInputType.text,
            textEditingController: namelController,
            isPassword: false,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailController,
            isPassword: false,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textEditingController: passwordController,
            isPassword: true,
          ),
          CustomButton(
            text: 'Crear cuenta',
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.register(
                        namelController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim());
                    if (loginOk == 'ok') {
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      mostrarAlerta(
                          context, 'Error', loginOk.trim() );
                    }
                  },
          ),
        ],
      ),
    );
  }
}
