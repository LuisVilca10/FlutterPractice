import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Pages/pagina2.dart';
import 'package:flutter_application_1/core/models/persona.dart';

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
  final Persona person = Persona(nombre: 'Luis Martin Vilca H', edad: 19);
  @override
  initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    seleccion = false;
    carrera = '';
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Correcto")));
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
                              
                      Navigator.pushNamed(context, 'segundapa', arguments: SegundaPaginaArgumentos(
                        usuario: Persona(
                          nombre: 'Martin',
                          edad: 19
                        )
                      ));
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
                    onTap: () {
                      print("Presion simple");
                    },
                    onLongPress: () {
                      print("presionado largo");
                    },
                    onDoubleTap: () {
                      print("Doble presionado");
                    })
              ])
            ])));
  }
}
