import 'package:flutter/material.dart';

class VoteConfirmation extends StatelessWidget {
  final String candidateName;
  final String partyName;

  VoteConfirmation({required this.candidateName, required this.partyName});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: [
          const TextSpan(text: 'Tu voto por '),
          TextSpan(
            text: candidateName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ' del partido '),
          TextSpan(
            text: partyName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(
              text: ' será registrado y no podras editarlo después.'),
        ],
      ),
    );
  }
}
