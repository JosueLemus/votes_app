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

  // Lista de candidatos con sus respectivos partidos políticos y URLs de imagen
  final List<Map<String, String>> candidates = [
    {
      'name': 'Luis Arce',
      'party': 'MAS-IPSP',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIoTpZitSq8XzVVkJQcmUB3SBk_uBrzixMpg&s',
    },
    {
      'name': 'Carlos Mesa',
      'party': 'Comunidad Ciudadana',
      'imageUrl':
          'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTTOTxBPkiBgGgThe0DlLKJvDnG4Jz7bPMP6R0Qs_QVooELLeaj7ftXjx94FUkiZgXUBmqxP23QJKorhko',
    },
    {
      'name': 'Luis Fernando Camacho',
      'party': 'Creemos',
      'imageUrl':
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRjiNOS66kljVM6xk5XjJE-tbPAbdQJJuRjUI3xwKD8UEFhka47',
    },
    {
      'name': 'Chi Hyun Chung',
      'party': 'Frente Para la Victoria',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Dr_Chi.jpg/440px-Dr_Chi.jpg',
    },
    {
      'name': 'Félix Patzi',
      'party': 'Movimiento Tercer Sistema',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrDZa6ARbwFpcgJN_gYy-noKPDmIb7xDHGZQ&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as bool?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de candidatos'),
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
        itemCount: candidates.length,
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
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                candidates[index]['imageUrl']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(candidates[index]['name']!),
            subtitle: Text(candidates[index]['party']!),
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
    if (selectedIndex == null) return;
    final selectedCandidate = candidates[selectedIndex!];

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
              VoteConfirmation(
                candidateName: selectedCandidate['name']!,
                partyName: selectedCandidate['party']!,
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(selectedCandidate['imageUrl']!),
              ),
              const SizedBox(height: 32),
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
