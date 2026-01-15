import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Unidade de Design Atômica para os botões secundários
  Widget _buildOrbitalBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: Offset(0, 4))],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 26),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. OUTDOOR SOBERANO & BRANDING ELEVADO
          Container(
            width: double.infinity,
            height: h * 0.44, // Proporção áurea para o outdoor
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 20), // Nome no topo absoluto
                child: Text(
                  "PETUNION",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 12),
                ),
              ),
            ),
          ),

          // 2. CARD IDENTITÁRIO (RECUO TÉCNICO)
          Transform.translate(
            offset: Offset(0, -h * 0.10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 30, offset: Offset(0, 15))],
              ),
              child: Column(
                children: [
                  Icon(Icons.pets, size: 55, color: Color(0xFFFF914D).withOpacity(0.2)),
                  SizedBox(height: 15),
                  Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  Text("GENÉTICA DE ELITE • BRASÍLIA/DF", style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
          ),

          // 3. GRADE QUADRADA COMPACTA (PRECISÃO DO TEMPLATE)
          Expanded(
            child: Center(
              child: Container(
                width: 240, // Largura fixa para manter os botões próximos (Template Look)
                height: 240, // Altura fixa para simetria quadrada
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // NÚCLEO CENTRAL: AMI
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF914D),
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Color(0xFFFF914D).withOpacity(0.4), blurRadius: 25, offset: Offset(0, 10))],
                          ),
                          child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))),
                        ),
                        SizedBox(height: 4),
                        Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF914D))),
                      ],
                    ),
                    // VÉRTICES DO QUADRADO (POSICIONAMENTO MATEMÁTICO)
                    Positioned(top: 0, left: 0, child: _buildOrbitalBtn(Icons.store, "Market")),
                    Positioned(top: 0, right: 0, child: _buildOrbitalBtn(Icons.favorite, "Match")),
                    Positioned(bottom: 0, left: 0, child: _buildOrbitalBtn(Icons.assignment, "Ads")),
                    Positioned(bottom: 0, right: 0, child: _buildOrbitalBtn(Icons.person, "Perfil")),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
