import 'package:flutter_application_1/core/models/persona.dart';

class PeronsaController {
  final Persona persona;
  PeronsaController(this.persona);

  void cambiarName(String nombre) {
    persona.nombre = nombre;
  }
}
