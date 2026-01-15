import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Widget de botão secundário (Estilo Minimalista da imagem)
  Widget _buildOrbitalBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: 22),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black45)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFF914D), // Fundo laranja total como na imagem
      body: Column(
        children: [
          // 1. NOME PETUNION NO TOPO (MÁXIMO IMPACTO)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "PETUNION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 10,
                ),
              ),
            ),
          ),

          // 2. O GRANDE OUTDOOR BRANCO (DOMINANTE)
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(25, 0, 25, 30),
              decoration: BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 30, offset: Offset(0, 15))],
              ),
              child: Column(
                children: [
                  // ÁREA DA IMAGEM DO PET (EXPANDIDA)
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pets, size: 80, color: Color(0xFFFF914D).withOpacity(0.2)),
                          SizedBox(height: 20),
                          Text("Thor - Bulldog Francês", 
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D3436))),
                          Text("GENÉTICA DE ELITE • BRASÍLIA/DF", 
                            style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                  ),

                  // 3. GRADE QUADRADA COM AMI (INTEGRADA AO CARD)
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // LINHA DE CIMA
                          Positioned(top: 0, left: 0, child: _buildOrbitalBtn(Icons.store, "Market")),
                          Positioned(top: 0, right: 0, child: _buildOrbitalBtn(Icons.favorite, "Match")),
                          
                          // CENTRO: AMI
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 15, offset: Offset(0, 8))],
                                ),
                                child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22))),
                              ),
                              SizedBox(height: 4),
                              Text("IA ASSISTANT", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.orange)),
                            ],
                          ),

                          // LINHA DE BAIXO
                          Positioned(bottom: 20, left: 0, child: _buildOrbitalBtn(Icons.assignment, "Ads")),
                          Positioned(bottom: 20, right: 0, child: _buildOrbitalBtn(Icons.person, "Perfil")),
                        ],
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
