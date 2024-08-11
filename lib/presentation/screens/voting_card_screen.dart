import 'package:flutter/material.dart';

class VotingCardScreen extends StatelessWidget {
  const VotingCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carnet de sufragio'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 32),
        child: Card(
          color: const Color(0xfff5f5f5),
          elevation: 7,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bolivia',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      Image.network(
                          width: 70,
                          height: 30,
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Bandera_de_Bolivia_%28Estado%29.svg/264px-Bandera_de_Bolivia_%28Estado%29.svg.png')
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manuel Sanchez',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Fecha y hora de votacion:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          Text(
                            '31 de Marzo del 2025 a las 10:00am',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Numero de identificador:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          Text(
                            '123332452',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Carnet de identidad:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          Text(
                            '123332452',
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Image.network(
                            width: 140,
                            height: 150,
                            'https://www.ivan-garcia.com/blog/wp-content/uploads/2019/01/foto-perfil-dni-2019.jpg',
                            fit: BoxFit.cover,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Image.network(
                                width: 140,
                                'https://cdn.shopify.com/s/files/1/0594/4639/5086/files/underline_b49eefdc-d72c-4e68-84a4-dcbd1404a772.jpg'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/800px-QR_code_for_mobile_English_Wikipedia.svg.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Ver seguimiento de voto')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
