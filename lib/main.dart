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
  // Botão circular otimizado para a grade quadrada
  Widget _buildCircleBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 58, // Tamanho ajustado para caber na grade sem overflow
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: Offset(0, 4))
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 24),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black45),
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
          // 1. OUTDOOR NO TOPO (MÁXIMA VISIBILIDADE)
          Container(
            width: double.infinity,
            height: screenHeight * 0.42,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
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

          // 2. CARD DO PET (THOR) - POSIÇÃO COMPACTA
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.08),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: Offset(0, 8))
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 50, color: Color(0xFFFF914D).withOpacity(0.2)),
                  SizedBox(height: 12),
                  Text(
                    "Thor - Bulldog Francês",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
                  ),
                  Text(
                    "GENÉTICA DE ELITE • BRASÍLIA/DF",
                    style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),

          // 3. GRADE QUADRADA COM AMI CENTRALIZADA
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LINHA 1: MARKET E MATCH
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleBtn(Icons.store, "Market"),
                      _buildCircleBtn(Icons.favorite, "Match"),
                    ],
                  ),
                  
                  // NÚCLEO: AMI
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF914D),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Color(0xFFFF914D).withOpacity(0.35), blurRadius: 18, offset: Offset(0, 8))
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AMI",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "IA ASSISTANT",
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                        ),
                      ],
                    ),
                  ),

                  // LINHA 2: ADS E PERFIL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleBtn(Icons.assignment, "Ads"),
                      _buildCircleBtn(Icons.person, "Perfil"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
