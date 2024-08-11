import 'package:flutter/material.dart';
import 'package:votes_app/presentation/widget/modals/vote_confirmation.dart';

class CandidatesList extends StatefulWidget {
  const CandidatesList({
    super.key,
  });

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as bool?;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de candidatos',
        ),
      ),
      floatingActionButton: selectedIndex == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                showConfirmationDialog(context);
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              label: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Continuar'),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14,
                  ),
                ],
              ),
            ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: arg == false
                ? null
                : () {
                    setState(() {
                      if (selectedIndex == index) {
                        selectedIndex = null;
                      } else {
                        selectedIndex = index;
                      }
                    });
                  },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(
                50,
              ),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlOSFmIyNFoAsYLOzO2eVucpJ9S_xiKHmWQw&s',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text('Evo Morales'),
            subtitle: Text('MAS-IPSP'),
            trailing: arg == false
                ? null
                : selectedIndex == index
                    ? const Icon(Icons.check_box_outlined)
                    : const Icon(Icons.check_box_outline_blank),
          );
        },
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '¿Estás seguro?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VoteConfirmation(candidateName: 'Evo Morales', partyName: 'MAS'),
              const SizedBox(
                height: 24,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlOSFmIyNFoAsYLOzO2eVucpJ9S_xiKHmWQw&s'),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Emitir Voto'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/signature');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
