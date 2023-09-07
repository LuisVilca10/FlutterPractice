import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/models/persona.dart';

class SegundaPaginaArgumentos {
  final Persona? usuario;
  final bool nuevo;
  SegundaPaginaArgumentos({this.usuario, this.nuevo = false});
}

class SegundaPagina extends StatefulWidget {
  final Persona? usuario;
  final bool nuevo;
  const SegundaPagina({super.key, this.usuario, this.nuevo = false});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  @override
  Widget build(BuildContext context) {
    SegundaPaginaArgumentos argumentos;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      argumentos =
          ModalRoute.of(context)?.settings.arguments as SegundaPaginaArgumentos;
    } else {
      argumentos = SegundaPaginaArgumentos();
    }
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context); //retrocedemos a la ruta anterior
              //Naviagtor.of(context).pop();
            },
          ),
          title: const Text('Segunda pagina')),
      body: Container(
        width: double.infinity,
        child:  Column( 
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/cachorros.jpg'
                )
              )
            ),
          ),
          Text(argumentos.usuario?.nombre ?? 'sin datos',
              style: TextStyle(fontSize: 20)),
          Text(argumentos.usuario?.edad.toString() ?? 'sin datos',
              style: TextStyle(fontSize: 20)),
          Container(
            height: 300,
            width: 300,
            child: Image.network('https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ', fit: BoxFit.cover,),
          )
        ],
      ),
      )
    );
  }
}
