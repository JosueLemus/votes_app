import 'package:flutter/material.dart';

class HomeOptionsGrid extends StatelessWidget {
  HomeOptionsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Options> options = [
      Options(
        titulo: 'Emitir voto',
        imagen:
            'https://img.freepik.com/premium-vector/man-with-voting-card-puts-his-vote-into-ballot-box-little-people-voters_667648-20.jpg?w=360',
        accion: () {
          Navigator.of(context).pushNamed('/candidates-list', arguments: true);
        },
      ),
      Options(
        titulo: 'Carnet de sufragio',
        imagen:
            'https://img.freepik.com/vector-gratis/ilustracion-tarjeta-identificativa_23-2147829294.jpg?semt=ais_hybrid',
        accion: () {
          Navigator.of(context).pushNamed('/voting-card');
        },
      ),
      Options(
        titulo: 'Resultados de votación',
        imagen:
            'https://img.freepik.com/premium-vector/voting-election-concept-with-box_23-2147916983.jpg',
        accion: () {
          print('Resultados de votación presionado');
        },
      ),
      Options(
        titulo: 'Lista de candidatos',
        imagen:
            'https://img.freepik.com/premium-vector/flat-illustration-candidates-list-editable-design_203633-4188.jpg',
        accion: () {
          Navigator.of(context).pushNamed('/candidates-list', arguments: false);
        },
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: GridView.builder(
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: options[index].accion,
            borderRadius: BorderRadius.circular(
              16,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: const Color(0xFFF5F5F5),
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.red,
                        child: Image.network(
                          options[index].imagen,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    options[index].titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Options {
  final String titulo;
  final String imagen;
  final VoidCallback accion;

  Options({
    required this.titulo,
    required this.imagen,
    required this.accion,
  });
}
