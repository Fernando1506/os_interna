import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/buttons.dart';
import '../relatorio_ordem_de_servico/relatorio.view.dart';
import 'login.controller.dart';

class LoginView extends StatelessWidget {
  LoginView({
    Key? key,
  }) : super(key: key) {
    controllerLogin = LoginController();
  }

  late LoginController controllerLogin;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),

      body: Center(
        child: Container(
          width: 500,
          height: 420,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Seg Controle',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório!';
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Usuário',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Informe o usuario',
                  ),
                  controller: controllerLogin.usuario,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório!';
                    }
                    return null;
                  },
                  autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Informe a senha',
                  ),
                  controller: controllerLogin.senha,
                ),
                const SizedBox(height: 50),
                Button(
                    text: "Login",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controllerLogin.logarSistema();
                      } else {
                        Container();
                      }
                    },
                    width: double.infinity)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
