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
  // Widget de botão compacto para evitar overflow
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
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 24),
        ),
        SizedBox(height: 4),
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
          // 1. OUTDOOR EXPANDIDO (NOME NO TOPO MÁXIMO)
          Container(
            width: double.infinity,
            height: screenHeight * 0.40, // Ajustado para evitar erro de espaço
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
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -20), // Sobe o nome para a borda
                  child: Text(
                    "PETUNION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD DO PET (MAIS COMPACTO)
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.06),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: Offset(0, 8))
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 45, color: Color(0xFFFF914D).withOpacity(0.2)),
                  SizedBox(height: 10),
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

          // 3. GRADE QUADRADA 2x2 COM AMI CENTRAL
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LINHA SUPERIOR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleBtn(Icons.store, "Market"),
                      _buildCircleBtn(Icons.favorite, "Match"),
                    ],
                  ),
                  
                  // AMI (O CENTRO DO QUADRADO)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF914D),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Color(0xFFFF914D).withOpacity(0.3), blurRadius: 15, offset: Offset(0, 8))
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AMI",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "IA ASSISTANT",
                          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                        ),
                      ],
                    ),
                  ),

                  // LINHA INFERIOR (PERFIL SUBSTITUI AJUSTES)
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
