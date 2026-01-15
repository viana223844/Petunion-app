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
  // Widget para os botões circulares agrupados
  Widget _buildCircleBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: Offset(0, 4))
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 28),
        ),
        SizedBox(height: 8),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. OUTDOOR EXPANDIDO (NOME NO TOPO EXTREMO)
            Container(
              width: double.infinity,
              height: screenHeight * 0.45,
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
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "PETUNION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. CARD DO PET (THOR)
            Transform.translate(
              offset: Offset(0, -screenHeight * 0.12),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 25, offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.pets, size: 70, color: Color(0xFFFF914D).withOpacity(0.3)),
                    SizedBox(height: 20),
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

            // 3. GRADE QUADRADA SIMÉTRICA COM AMI NO CENTRO
            Transform.translate(
              offset: Offset(0, -screenHeight * 0.05),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    // PRIMEIRA LINHA: MARKET E MATCH
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircleBtn(Icons.store, "Market"),
                        _buildCircleBtn(Icons.favorite, "Match"),
                      ],
                    ),
                    
                    // LINHA CENTRAL: AMI (DESTAQUE)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
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
                          SizedBox(height: 8),
                          Text(
                            "IA ASSISTANT",
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFFF914D)),
                          ),
                        ],
                      ),
                    ),

                    // TERCEIRA LINHA: ADS E PERFIL (SIMETRIA TOTAL)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircleBtn(Icons.assignment, "Ads"),
                        _buildCircleBtn(Icons.person, "Perfil"),
                      ],
                    ),
                    
                    SizedBox(height: 20),
                    // BOTÃO CHAT (ADICIONADO COMO ELEMENTO DE APOIO ABAIXO)
                    _buildCircleBtn(Icons.chat_bubble, "Chat"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
