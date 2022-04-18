import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/homepage.view.dart';
import '../relatorio/relatorio.view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                'Login',
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
              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Informe o usuario',
                ),
              ),
              const SizedBox(height: 35),
              const TextField(
                autofocus: true,
                obscureText: true,
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
                    Get.off(RelatorioView());
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
