import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'Al continuar, aceptas nuestros ',
              style: TextStyle(
                color: Color(0xFF828282),
              )),
          TextSpan(
              text: 'Términos de servicio y Políticas de privacidad',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
