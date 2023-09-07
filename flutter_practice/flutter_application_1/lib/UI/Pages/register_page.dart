import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  final _formRegiskey = GlobalKey<FormState>();

  late TextEditingController _nombres;
  late TextEditingController _paterno;
  late TextEditingController _materno;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirpassword;
  late TextEditingController _Nacimineto;
  late TextEditingController _Empresa;

  final baseUrl = 'https://test-usuarios.herokuapp.com/api';

  //late TextEditingController _controller2;

  @override
  void initState() {
    _nombres = TextEditingController(text: '');
    _paterno = TextEditingController(text: '');
    _materno = TextEditingController(text: '');
    _email = TextEditingController(text: '');
    _password = TextEditingController(text: '');
    _confirpassword = TextEditingController(text: '');
    _Nacimineto = TextEditingController(text: '');
    _Empresa = TextEditingController(text: '');

    //_controller2 = TextEditingController(text: '');
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
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/logo1.png', width: 150, height: 150),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Crear una Cuenta',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formRegiskey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _nombres,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            hintText: 'Ej: Juan Luis',
                            label: Text('Nombres')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El Nombre es obligatorio';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              controller: _paterno,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                  hintText: 'Apellido Paterno',
                                  label: Text('Apellido Paterno')),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == '') {
                                  return 'El campo es obligatorio';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormField(
                              controller: _materno,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                  hintText: 'Apellido Materno',
                                  label: Text('Apellido Materno')),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == '') {
                                  return 'El campo es obligatorio';
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            hintText: 'ejemplo@ejemplo.com',
                            label: Text('Conrreo')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El Correo es obligatorio';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                            //hintText: 'ejemplo@ejemplo.com',
                            label: Text('Contraseña')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'La contraseña es obligatorio';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: _confirpassword,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined),
                            border: OutlineInputBorder(),
                            //hintText: 'ejemplo@ejemplo.com',
                            label: Text('Confirme Contraseña')),
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return 'El campo es obligatorio';
                          }
                          if (value != _password.value.text) {
                            return 'La contraseña no coincide';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              controller: _Nacimineto,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.date_range),
                                  border: OutlineInputBorder(),
                                  hintText: 'Ej: Juan Luis',
                                  label: Text('Fecha de nacimiento')),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == '') {
                                  return 'El campo es obligatorio';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormField(
                              controller: _Empresa,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.compare_rounded),
                                  border: OutlineInputBorder(),
                                  hintText: 'Empresa',
                                  label: Text('Empresa')),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == '') {
                                  return 'El campo es obligatorio';
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formRegiskey.currentState!.validate()) {
                      final uri = Uri.parse("${baseUrl}/registrar");
                      final response = await http.post(uri, body: {
                        "Nombres": _nombres.value.text,
                        "ApellidoPaterno": _paterno.value.text,
                        "ApellidoMaterno": _materno.value.text,
                        "emial": _email.value.text,
                        "password": _password.value.text,
                        "Empresa": _Empresa.value.text,
                        "Fecha": _Nacimineto.value.text
                      });
                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Usuario creado")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Problemas en el servidor")));
                      }
                    }
                  },
                  child: const Text('Crear cuenta'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nombres.dispose();
    _paterno.dispose();
    _materno.dispose();
    _password.dispose();
    _confirpassword.dispose();
    _email.dispose();
    _Nacimineto.dispose();
    _Empresa.dispose();
    super.dispose();
  }
}
