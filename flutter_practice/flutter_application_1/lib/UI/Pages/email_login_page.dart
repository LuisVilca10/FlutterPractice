import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Pages/remenber_password.dart';

import 'package:http/http.dart' as http;

class EmailLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailLoginPageState();
  }
}

class EmailLoginPageState extends State<EmailLoginPage> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _controller;
  late TextEditingController _controller2;

  final baseUrl = 'https://test-usuarios.herokuapp.com/api';

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); //retrocedemos a la ruta anterior
            //Naviagtor.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo1.png', width: 200, height: 190),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                              hintText: 'ejemplo@ejemplo.com',
                              label: Text('Email')),
                          validator: (value) {
                            if (value == null || value.isEmpty || value == '') {
                              return 'El correo es obligatorio';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                          controller: _controller2,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                              //hintText: '******',
                              label: Text('Contraseña')),
                          validator: (value) {
                            if (value == null || value.isEmpty || value == '') {
                              return 'La contraseña es obligatorio';
                            }
                            return null;
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RememberPaswword()));
                  },
                  child: const Text(
                    "Recuperar contraseña",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        final uri = Uri.parse("$baseUrl/login");
                        final response = await http.post(uri, body: {
                          "email": _controller.value.text,
                          "password": _controller2.value.text,
                        });
                        if (response.statusCode == 200) {
                          final json = jsonDecode(response.body);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Sección iniciada ${json['Persona']}")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Las credencias son incorrectas")));
                        }
                        print(response.body);
                      }
                    },
                    child: const Text('Iniciar Sesion'))
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
