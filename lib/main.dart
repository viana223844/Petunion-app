import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Widget de botão Neumórfico ajustado para escala menor
  Widget _buildNeumorphicBtn(IconData icon, String label, double btnSize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: btnSize,
          height: btnSize,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: btnSize * 0.5),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // RESOLUÇÃO DO ERRO: Definindo 'size' corretamente aqui
    final size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFF914D),
      body: Stack(
        children: [
          // 1. BRANDING NO TOPO
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("PETUNION", 
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 8)),
              ),
            ),
          ),

          // 2. O OUTDOOR (CENTRO DAS ATENÇÕES - ESTILO TEMPLATE 1002879956)
          Positioned(
            top: h * 0.12,
            left: 20,
            right: 20,
            child: Container(
              height: h * 0.48, // Maior destaque na tela
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 30, offset: Offset(0, 15))],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Thor", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFFFF914D))),
                  Text("Bulldog Francês", style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600)),
                  SizedBox(height: 20),
                  // Avatar do Pet
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF8F9FA),
                      border: Border.all(color: Color(0xFFFF914D), width: 2),
                    ),
                    child: Icon(Icons.pets, size: 60, color: Color(0xFFFF914D).withOpacity(0.3)),
                  ),
                  SizedBox(height: 20),
                  Text("GENÉTICA DE ELITE", style: TextStyle(letterSpacing: 2, fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange)),
                  Text("BRASÍLIA / DF", style: TextStyle(fontSize: 12, color: Colors.black38)),
                ],
              ),
            ),
          ),

          // 3. MENU INFERIOR (COMPACTO E PROPORCIONAL)
          Positioned(
            bottom: h * 0.04,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // AMI (DESTAQUE CENTRAL)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 85, // Maior que os outros, mas sem exageros
                        height: 85,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 15, offset: Offset(0, 8))],
                        ),
                        child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22))),
                      ),
                      SizedBox(height: 4),
                      Text("IA ASSISTANT", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.white)),
                    ],
                  ),
                  
                  // ÓRBITA COMPACTA (CÍRCULOS MENORES)
                  Positioned(top: 0, left: w * 0.18, child: _buildNeumorphicBtn(Icons.store, "Market", 48)),
                  Positioned(top: 0, right: w * 0.18, child: _buildNeumorphicBtn(Icons.favorite, "Match", 48)),
                  Positioned(bottom: 15, left: w * 0.20, child: _buildNeumorphicBtn(Icons.assignment, "Ads", 48)),
                  Positioned(bottom: 15, right: w * 0.20, child: _buildNeumorphicBtn(Icons.person, "Perfil", 48)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
