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
  // Widget para criar os botões circulares compactos
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
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 24),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. OUTDOOR (HEADER)
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Text(
                    "PETUNION",
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 5),
                  ),
                ),
              ),
            ),

            // 2. CARD DO PET (THOR)
            Transform.translate(
              offset: Offset(0, -40),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                ),
                child: Column(
                  children: [
                    Icon(Icons.pets, size: 60, color: Color(0xFFFF914D).withOpacity(0.4)),
                    SizedBox(height: 15),
                    Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Genética de Elite • Brasília/DF", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),

            // 3. AGRUPAMENTO DE CÍRCULOS (ESTILO TEMPLATE)
            // Formato de Grade com AMI no Centro
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircleBtn(Icons.store, "Market"),
                      _buildCircleBtn(Icons.favorite, "Match"),
                      _buildCircleBtn(Icons.chat, "Chat"),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircleBtn(Icons.assignment, "Ads"),
                      // AMI CENTRALIZADA (MAIOR)
                      Column(
                        children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF914D),
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Color(0xFFFF914D).withOpacity(0.4), blurRadius: 15, offset: Offset(0, 8))],
                            ),
                            child: Center(
                              child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF914D))),
                        ],
                      ),
                      _buildCircleBtn(Icons.settings, "Ajustes"),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleBtn(Icons.person, "Perfil"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
