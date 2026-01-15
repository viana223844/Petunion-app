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
          // 1. FUNDO LARANJA (GRADIENTE + CURVA DO HEADER)
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          // 2. CONTEÚDO PRINCIPAL (HEADER + CARD)
          SafeArea(
            child: Column(
              children: [
                // Header: Título e Ícones Laterais
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.pets, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      Spacer(),
                      Icon(Icons.add, color: Colors.white, size: 28),
                      SizedBox(width: 15),
                      Icon(Icons.notifications_none, color: Colors.white, size: 28),
                    ],
                  ),
                ),

                // CARD DO THOR (ESTILO SOCIALS & ACCOUNTS)
                Container(
                  width: size.width * 0.9,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                      SizedBox(height: 10),
                      Text("Selecione os detalhes para compartilhar no Match.", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black38, fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(height: 25),
                      // Foto Central
                      Container(
                        width: 90, height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orange.shade100, width: 3),
                          color: Colors.grey[100],
                        ),
                        child: Icon(Icons.pets, color: Colors.orange, size: 40),
                      ),
                      SizedBox(height: 15),
                      Text("6 / 8", style: TextStyle(fontSize: 42, fontWeight: FontWeight.w200, color: Colors.grey[300])),
                      Container(width: 50, height: 2, color: Colors.grey[200]),
                    ],
                  ),
                ),

                Spacer(),

                // 3. AMI (IA CENTRALIZADA E IMPOSTA)
                Container(
                  width: 105, height: 105,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 25, offset: Offset(0, 12))],
                  ),
                  child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
                ),
                SizedBox(height: 5),
                Text("IA ASSISTANT", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFFF6B00))),
                
                SizedBox(height: 20),

                // 4. BARRA DE NAVEGAÇÃO (TABBAR LIMPA)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _tabIcon(Icons.storefront, "Market"),
                      _tabIcon(Icons.favorite_border, "Match"),
                      SizedBox(width: 40), // Espaço da AMI
                      _tabIcon(Icons.assignment_outlined, "Ads"),
                      _tabIcon(Icons.person_outline, "Perfil"),
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

  Widget _tabIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[400], size: 26),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
