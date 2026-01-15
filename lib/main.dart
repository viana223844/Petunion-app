import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. FUNDO DINÂMICO (CURVA SUPERIOR LARANJA)
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),

          // 2. CAMADA DE CONTEÚDO
          SafeArea(
            child: Column(
              children: [
                // HEADER MINIMALISTA
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.pets, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      Spacer(),
                      Icon(Icons.add, color: Colors.white, size: 28),
                      SizedBox(width: 15),
                      Badge(label: Text("4"), child: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26)),
                    ],
                  ),
                ),

                // 3. O CARD "OUTDOOR" (FIDELIDADE TOTAL)
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.40,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25, offset: Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text("Sociais & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                            SizedBox(height: 8),
                            Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      // AVATAR CIRCULAR
                      Container(
                        width: 95, height: 95,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                          image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?img=11'), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 15),
                      // CONTADOR 6/8
                      Text("6 / 8", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w200, color: Colors.grey[300], letterSpacing: -2)),
                      Container(width: 60, height: 2, color: Colors.orange.withOpacity(0.2)),
                    ],
                  ),
                ),

                Spacer(),

                // 4. AMI - A INTELIGÊNCIA CENTRAL (FLUTUANTE SOBRE A NAV)
                Transform.translate(
                  offset: Offset(0, 35), // Faz a AMI "pousar" na barra
                  child: Column(
                    children: [
                      Container(
                        width: 100, height: 100,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 25, offset: Offset(0, 10))],
                        ),
                        child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
                      ),
                      SizedBox(height: 5),
                      Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF6B00))),
                    ],
                  ),
                ),

                // 5. BARRA DE NAVEGAÇÃO CUSTOMIZADA (DESIGN 1002880357)
                Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _navItem(Icons.storefront_outlined, "Market"),
                      _navItem(Icons.favorite_border, "Match"),
                      SizedBox(width: 50), // Espaço central para a AMI
                      _navItem(Icons.assignment_outlined, "Ads"),
                      _navItem(Icons.person_outline, "Perfil"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[400], size: 28),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
