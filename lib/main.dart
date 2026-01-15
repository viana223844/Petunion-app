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
  // Widget para os botões circulares da grade
  Widget _buildCircleBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 12, offset: Offset(0, 5))
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 26),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54),
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
          // 1. OUTDOOR MAXIMIZADO COM NOME NO TOPO EXTREMO
          Container(
            width: double.infinity,
            height: screenHeight * 0.45, // Expandido para maior impacto visual
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5), // Nome colado na borda superior
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
                ],
              ),
            ),
          ),

          // 2. CARD DO PET (THOR) - SOBREPOSIÇÃO ELEGANTE
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 25, offset: Offset(0, 12))
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 60, color: Color(0xFFFF914D).withOpacity(0.2)),
                  SizedBox(height: 15),
                  Text(
                    "Thor - Bulldog Francês",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "GENÉTICA DE ELITE • BRASÍLIA/DF",
                    style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
          ),

          // 3. GRADE QUADRADA SIMÉTRICA (SEM AJUSTES, COM PERFIL)
          Expanded(
            child: Transform.translate(
              offset: Offset(0, -screenHeight * 0.04),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
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
                    
                    // NÚCLEO CENTRAL: AMI
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 105,
                            height: 105,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF914D),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFFF914D).withOpacity(0.4),
                                  blurRadius: 25,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "AMI",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "IA ASSISTANT",
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                          ),
                        ],
                      ),
                    ),

                    // LINHA 2: ADS E PERFIL (SUBSTITUINDO AJUSTES)
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
          ),
        ],
      ),
    );
  }
}
