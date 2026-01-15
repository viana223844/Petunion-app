import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Widget de botão Neumórfico (Efeito de profundidade real do template)
  Widget _buildNeumorphicBtn(IconData icon, String label, {double size = 50}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              BoxShadow(color: Colors.white, blurRadius: 2, offset: Offset(-2, -2)),
            ],
          ),
          child: Icon(icon, color: Color(0xFFFF914D), size: size * 0.45),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFF914D),
      body: Stack(
        children: [
          // 1. BRANDING E HEADER
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 8)),
              ),
            ),
          ),

          // 2. O OUTDOOR DOMINANTE (SOCIALS & ACCOUNTS STYLE)
          Positioned(
            top: h * 0.12,
            left: 20,
            right: 20,
            child: Container(
              height: h * 0.45,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 40, offset: Offset(0, 20))],
              ),
              child: Column(
                children: [
                  Text("Socials & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFFFF914D))),
                  SizedBox(height: 8),
                  Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w500)),
                  
                  Spacer(),
                  // Avatar Central do Thor (Estilo o humano do template)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFFF914D), width: 3),
                      boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 15)],
                      color: Colors.white,
                    ),
                    child: Center(child: Icon(Icons.pets, size: 50, color: Color(0xFFFF914D))),
                  ),
                  SizedBox(height: 12),
                  Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("6 / 8", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.black38)),
                  Spacer(),
                ],
              ),
            ),
          ),

          // 3. MENU ORBITAL (ESTILO PRECISO DO NOVO TEMPLATE)
          Positioned(
            bottom: h * 0.05,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // AMI CENTRAL (MAIOR E COM GLOW)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.5), blurRadius: 20, offset: Offset(0, 8))],
                        ),
                        child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24))),
                      ),
                      SizedBox(height: 5),
                      Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Colors.white)),
                    ],
                  ),
                  
                  // BOTÕES EM VOLTA (POSIÇÕES DO TEMPLATE)
                  Positioned(top: 0, left: size.width * 0.2, child: _buildNeumorphicBtn(Icons.store, "Market")),
                  Positioned(top: 0, right: size.width * 0.2, child: _buildNeumorphicBtn(Icons.favorite, "Match")),
                  Positioned(bottom: 10, left: size.width * 0.22, child: _buildNeumorphicBtn(Icons.assignment, "Ads")),
                  Positioned(bottom: 10, right: size.width * 0.22, child: _buildNeumorphicBtn(Icons.person, "Perfil")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
