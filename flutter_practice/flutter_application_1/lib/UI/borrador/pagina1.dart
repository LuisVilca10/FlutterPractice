import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/borrador/pagina2.dart';
import 'package:flutter_application_1/core/models/persona.dart';
import 'package:flutter_application_1/core/controller/PeronsaController.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Formulariopag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormulariopagState();
  }
}

class FormulariopagState extends State<Formulariopag> {
  // llave global
  final _formkey = GlobalKey<FormState>();
  List<String> pa = ['Peru', 'Ecuador', 'Chile'];
  //texto field
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late bool seleccion;
  late String carrera;
  late String? pais;
  late String respuesta;
  final Persona person = Persona(nombre: 'Luis Martin Vilca H', edad: 19);
  final hivestore = Hive.box('hiveStore');
  late final SharedPreferences preferencesStore;
  void initSharedPreference() async {
    preferencesStore = await SharedPreferences.getInstance();
    var carreraPrefs = preferencesStore.getString('carrera') ?? '';
    setState(() {
      carrera = carreraPrefs;
    });
  }

  @override
  initState() {
    initSharedPreference();
    _controller = TextEditingController(text: hivestore.get('nombre'));
    _controller2 = TextEditingController(text: hivestore.get('edad'));
    seleccion = false;
    carrera = '';
    respuesta = '';
    pais = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //controlor exacto de todo lo que esta dentro
    return Container(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formkey,
            child: ListView(children: [
              TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ej: Luis Vilca',
                      label: Text('Nombre completo')),
                  validator: (value) {
                    if (value == null || value.isEmpty || value == '') {
                      return 'El Nombre es obligatorio';
                    }
                    return null;
                  }),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ej: 18',
                      label: Text('Edad')),
                  onChanged: (valor) {
                    print("Esta es mi edad $valor");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty || value == '') {
                      return 'La edad es obligatorio';
                    }
                    return null;
                  }),
              ListTile(
                title: const Text("Eres nuevo programador"),
                subtitle: const Text("Selecciona si eres nuevo programado"),
                leading: Checkbox(
                    value: seleccion,
                    onChanged: (value) {
                      //actualiza los estados
                      setState(() {
                        if (value != null) {
                          seleccion = value;
                        }
                      });
                    }),
              ),
              const Text("Selleciona tu carrera"),
              ListTile(
                  title: const Text("Informatica"),
                  trailing: Radio(
                      groupValue: carrera,
                      value: 'Informatica',
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            carrera = value;
                          }
                        });
                      })),
              ListTile(
                  title: const Text("Electronico"),
                  trailing: Radio(
                      groupValue: carrera,
                      value: 'Electronico',
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            carrera = value;
                          }
                        });
                      })),
              const Text("Selleciona tu pais"),
              DropdownButton<String>(
                  value: pais,
                  items: pa.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      if (value != null) {
                        pais = value;
                      }
                    });
                  }),
              Row(children: [
                TextButton(
                    child: const Text('Validar'),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (carrera == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("carrera no seleccionada")));
                        } else {
                          hivestore.put('nombre', _controller.value.text);
                          hivestore.put('edad', _controller2.value.text);
                          preferencesStore.setString('carrera', carrera);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Datos almacenados")));
                        }
                      }
                    }),
                const SizedBox(width: 9),
                OutlinedButton(child: const Text('segundo'), onPressed: () {}),
                const SizedBox(width: 9),
                ElevatedButton(
                    child: const Text('tercero'),
                    onPressed: () {
                      //Navigator.push(
                      //    context,
                      //    MaterialPageRoute(
                      //        builder: (context) => SegundaPagina(
                      //          usuario: person,

                      //        )));
                      final controlador = PeronsaController(person);
                      controlador.cambiarName('Enrique');
                      Navigator.pushNamed(context, 'segundapa',
                          arguments: SegundaPaginaArgumentos(usuario: person));
                    }),
                const SizedBox(width: 9),
                GestureDetector(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text("cuatro")),
                    onTap: () async {
                      var url = Uri.parse(
                          'https://jsonplaceholder.typicode.com/todos/1');
                      var respuestaperticion = await http.get(url);
                      var json = jsonDecode(respuestaperticion.body);
                      setState(() {
                        respuesta = json['title'];
                      });
                    },
                    onLongPress: () {
                      print("presionado largo");
                    },
                    onDoubleTap: () {
                      print("Doble presionado");
                    }),
              ]),
              Text(respuesta)
            ])));
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    hivestore.close();
    super.dispose();
  }
}
