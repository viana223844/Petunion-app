import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Widget de Satélites: Pequenos, elegantes e discretos
  Widget _buildSatellite(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40, 
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: Offset(0, 2))],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 18),
        ),
        SizedBox(height: 3),
        Text(label, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.black45)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFF914D),
      body: Column(
        children: [
          // 1. BRANDING TOPO (ALTO IMPACTO)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "PETUNION",
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 12),
              ),
            ),
          ),

          // 2. O OUTDOOR (O REI DA TELA - 55% DE ALTURA)
          Container(
            width: double.infinity,
            height: h * 0.55,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 40, offset: Offset(0, 20))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Thor", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFFFF914D))),
                Text("Bulldog Francês", style: TextStyle(fontSize: 18, color: Colors.black45, fontWeight: FontWeight.w600)),
                
                // Área da Imagem Centralizada
                Container(
                  height: h * 0.25,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Icon(Icons.pets, size: 120, color: Color(0xFFFF914D).withOpacity(0.1)),
                  ),
                ),

                Text("GENÉTICA DE ELITE", style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
                Text("BRASÍLIA / DF", style: TextStyle(color: Colors.black26, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // 3. MENU INFERIOR (COMPACTO E ORBITAL - AMI PROTAGONISTA)
          Expanded(
            child: Center(
              child: Container(
                width: 220, // REDUZIDO: Para os círculos "abraçarem" a AMI
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // AMI: O SOL DO SISTEMA
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90, // DESTAQUE: AMI maior
                          height: 90,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 20, offset: Offset(0, 10))],
                          ),
                          child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24))),
                        ),
                        SizedBox(height: 5),
                        Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Colors.white)),
                      ],
                    ),
                    
                    // ÓRBITA FECHADA (POSIÇÕES MATEMÁTICAS PRECISAS)
                    Positioned(top: 15, left: 5, child: _buildSatellite(Icons.store, "Market")),
                    Positioned(top: 15, right: 5, child: _buildSatellite(Icons.favorite, "Match")),
                    Positioned(bottom: 15, left: 10, child: _buildSatellite(Icons.assignment, "Ads")),
                    Positioned(bottom: 15, right: 10, child: _buildSatellite(Icons.person, "Perfil")),
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
