import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  late SignatureController _signatureController;
  bool _isSignatureEmpty = true;

  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      onDrawEnd: () {
        setState(() {
          _isSignatureEmpty = _signatureController.isEmpty;
        });
      },
    );
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firma requerida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Para continuar, firme abajo:',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Signature(
                  controller: _signatureController,
                  height: 400,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSignatureEmpty
                    ? null
                    : () {
                        // Lógica para continuar, como navegar a otra pantalla
                        print('Firma guardada y continuar');
                      },
                child: const Text('Continuar'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  _signatureController.clear();
                  setState(() {
                    _isSignatureEmpty = true;
                  });
                },
                child: const Text('Borrar firma'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
