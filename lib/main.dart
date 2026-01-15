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
  // Widget de botão ultra-compacto para simetria total
  Widget _buildCircleBtn(IconData icon, String label) {
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
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: Offset(0, 3))
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 22),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black45),
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
          // 1. OUTDOOR MAXIMIZADO (NOME NO TOPO)
          Container(
            width: double.infinity,
            height: screenHeight * 0.43,
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
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "PETUNION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD DO THOR (POSIÇÃO CORRIGIDA)
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.08),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: Offset(0, 5))
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 45, color: Color(0xFFFF914D).withOpacity(0.2)),
                  SizedBox(height: 8),
                  Text(
                    "Thor - Bulldog Francês",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
                  ),
                  Text(
                    "GENÉTICA DE ELITE • BRASÍLIA/DF",
                    style: TextStyle(color: Colors.orange, fontSize: 9, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),

          // 3. O "QUADRADO" DE BOTÕES (PRECISÃO DO TEMPLATE)
          Expanded(
            child: Center(
              child: Container(
                width: 260, // Largura fixa para garantir o formato quadrado
                height: 260, // Altura fixa para simetria total
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // AMI NO CENTRO EXATO
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF914D),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Color(0xFFFF914D).withOpacity(0.4), blurRadius: 15, offset: Offset(0, 6))
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AMI",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "IA ASSISTANT",
                          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                        ),
                      ],
                    ),
                    // BOTÕES NOS VÉRTICES (FORMATO QUADRADO)
                    Positioned(top: 0, left: 0, child: _buildCircleBtn(Icons.store, "Market")),
                    Positioned(top: 0, right: 0, child: _buildCircleBtn(Icons.favorite, "Match")),
                    Positioned(bottom: 0, left: 0, child: _buildCircleBtn(Icons.assignment, "Ads")),
                    Positioned(bottom: 0, right: 0, child: _buildCircleBtn(Icons.person, "Perfil")),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Margem de segurança inferior
        ],
      ),
    );
  }
}
