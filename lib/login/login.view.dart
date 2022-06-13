import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/login/login.controller.dart';
import '../page/homepage.view.dart';
import '../relatorio_ordem_de_servico/relatorio.view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),

      body: Center(
        child: Container(
          width: 500,
          height: 380,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
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
              TextField(
                autofocus: true,
                controller: controller.userInput,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Informe o usuario',
                ),
              ),
              const SizedBox(height: 35),
              TextField(
                autofocus: true,
                obscureText: true,
                controller: controller.passInput,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Informe a senha',
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    controller.tryAuth();
                    // Get.off(RelatorioView());
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
