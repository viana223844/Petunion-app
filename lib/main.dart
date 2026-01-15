import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Botão orbital com design limpo e sombra suave
  Widget _buildOrbitalBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 26),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black45)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFF914D), // Fundo laranja da marca
      body: Column(
        children: [
          // 1. BRANDING NO TOPO ABSOLUTO
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "PETUNION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 10,
                ),
              ),
            ),
          ),

          // 2. O GRANDE OUTDOOR BRANCO (ESTILO NANOBANA)
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 40, offset: Offset(0, 20))],
              ),
              child: Column(
                children: [
                  // ÁREA DO PET (THOR)
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pets, size: 90, color: Color(0xFFFF914D).withOpacity(0.15)),
                        SizedBox(height: 15),
                        Text("Thor - Bulldog Francês", 
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
                        Text("GENÉTICA DE ELITE • BRASÍLIA/DF", 
                          style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1)),
                      ],
                    ),
                  ),

                  // 3. O "DIAMANTE" DE BOTÕES (CENTRALIZADO E ESPAÇADO)
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Container(
                        width: 280, // Aumentado para dar "ar" entre os círculos
                        height: 280,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // AMI NO CENTRO (O SOL)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                                    shape: BoxShape.circle,
                                    boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 20, offset: Offset(0, 10))],
                                  ),
                                  child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24))),
                                ),
                                SizedBox(height: 5),
                                Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Colors.orange)),
                              ],
                            ),
                            
                            // BOTÕES ORBITAIS (POSICIONAMENTO EM DIAMANTE)
                            Positioned(top: 0, left: 30, child: _buildOrbitalBtn(Icons.store, "Market")),
                            Positioned(top: 0, right: 30, child: _buildOrbitalBtn(Icons.favorite, "Match")),
                            Positioned(bottom: 20, left: 30, child: _buildOrbitalBtn(Icons.assignment, "Ads")),
                            Positioned(bottom: 20, right: 30, child: _buildOrbitalBtn(Icons.person, "Perfil")),
                          ],
                        ),
                      ),
                    ),
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
