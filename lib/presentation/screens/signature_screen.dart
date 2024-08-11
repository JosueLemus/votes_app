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
                        _showConfirmationPopup(context);
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

  void _showConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Voto Emitido!'),
          content: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text:
                      'Tu voto ha sido emitido y puedes seguirlo con el siguiente address: ',
                ),
                TextSpan(
                  text: 'wedghjy-refdse-rewfdsfb-fdsfds-fbvcbf-dsqwer',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nTambién podrás hacer seguimiento desde el carnet de sufragio en la pantalla principal de la app.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el popup
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home',
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
