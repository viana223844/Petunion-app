import 'package:flutter/material.dart';

void main() {
  runApp(PetunionApp());
}

class PetunionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetunionHome(),
    );
  }
}

class PetunionHome extends StatelessWidget {
  // Widget de ícone com estética premium do template
  Widget _buildIconTile(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 24),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. OUTDOOR MAXIMIZADO & NOME NO TOPO (PRECISÃO)
          Container(
            width: double.infinity,
            height: screenHeight * 0.40, 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "PETUNION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD DO THOR (ALINHADO AO CONTEXTO)
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.08),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 50, color: Color(0xFFFF914D).withOpacity(0.3)),
                  SizedBox(height: 12),
                  Text(
                    "Thor - Bulldog Francês",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "GENÉTICA DE ELITE • BRASÍLIA/DF",
                    style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),

          // 3. GRADE COMPACTA (SISTEMA SOLAR - PRECISÃO TOTAL)
          Expanded(
            child: Center(
              child: Container(
                width: 250, // Largura controlada para simetria absoluta
                height: 250, // Altura controlada
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // AMI NO NÚCLEO
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF914D),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFF914D).withOpacity(0.4),
                                blurRadius: 20,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AMI",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "IA ASSISTANT",
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                        ),
                      ],
                    ),
                    // BOTÕES NAS QUATRO EXTREMIDADES (O QUADRADO)
                    Positioned(top: 0, left: 10, child: _buildIconTile(Icons.store, "Market")),
                    Positioned(top: 0, right: 10, child: _buildIconTile(Icons.favorite, "Match")),
                    Positioned(bottom: 0, left: 10, child: _buildIconTile(Icons.assignment, "Ads")),
                    Positioned(bottom: 0, right: 10, child: _buildIconTile(Icons.person, "Perfil")),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Espaçamento estético final
        ],
      ),
    );
  }
}
