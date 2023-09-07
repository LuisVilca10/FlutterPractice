import 'package:flutter/material.dart';

class RememberPaswword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RememberPaswwordState();
  }
}

class RememberPaswwordState extends State<RememberPaswword> {
  late TextEditingController _email;
  @override
  void initState() {
    _email = TextEditingController(text: '');
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
      body: Center(
          //width: double.infinity,
          //height: double.infinity,
          //padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo1.png', width: 150, height: 150),
            const Text(
              "Recuperar contraseña",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
              child: Form(
                child: TextFormField(
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
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Recuperar Contraseña'))
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }
}
