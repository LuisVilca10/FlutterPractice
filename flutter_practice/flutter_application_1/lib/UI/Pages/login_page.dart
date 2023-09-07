import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Pages/email_login_page.dart';
import 'package:flutter_application_1/UI/Pages/register_page.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Bienvenido'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/logo1.png', width: 200, height: 190),
            const Text(
              'Bienvenido pagina de prueba',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                SocialLoginButton(
                    buttonType: SocialLoginButtonType.google, onPressed: () {}),
                const SizedBox(
                  height: 18,
                ),
                SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {}),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailLoginPage()));
                  },
                  child: const Text(
                    "Iniciar Sección con correo",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const Text("0"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text("Crear Cuenta",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
