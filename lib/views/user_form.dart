import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            //VALIDAÇÃO CAMPO NOME
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState?.save();
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  //VALIDADOR CAMPO NOME
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe um novme válido.';
                    }

                    if (value.trim().length < 3) {
                      return 'Informe um nome com no mínimo três letras.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    //IMPRIME O NOME VALIDO NO TERMINAL
                    print(value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Url do Avatar'),
                ),
              ],
            )),
      ),
    );
  }
}
