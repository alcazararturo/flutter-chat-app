import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_label.dart';
import 'package:chat/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
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
                CustomLogo(titulo: 'Messager'),
                _Form(),
                CustomLabel(
                    msg: '¿No tienes cuenta?',
                    text: 'Crea una ahora',
                    ruta: 'register'),
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
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
            text: 'Ingresar',
            onPressed: () {
              Map<String, String> user = {
                'email': emailController.text,
                'password': passwordController.text
              };
              print(user);
            },
          ),
        ],
      ),
    );
  }
}
