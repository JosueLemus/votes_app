import 'package:flutter/material.dart';
import 'package:votes_app/presentation/widget/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'MyVote',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: Image.network(
                  'https://img.freepik.com/premium-vector/illustration-hand-dropping-ballot-into-ballot-box-elections-referendums_630511-53.jpg?w=360',
                ),
              ),
              const Text(
                'Bienvenido',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Text(
                'Por favor, inicia sesión para seguir adelante.',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
              ),
              const TermsAndConditionsText()
            ],
          ),
        ),
      ),
    );
  }
}
