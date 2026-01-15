import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  // Botoes da TabBar inferior: pequenos, cinzas e minimalistas
  Widget _buildTabItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[600], size: 24),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600], fontWeight: FontWeight.w500)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. FUNDO LARANJA SUPERIOR (CURVADO)
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF8A00), Color(0xFFFF6B00)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),

          // 2. CONTEÚDO PRINCIPAL
          SafeArea(
            child: Column(
              children: [
                // HEADER (LOGO + ICONES)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: Icon(Icons.pets, color: Color(0xFFFF6B00), size: 20),
                      ),
                      SizedBox(width: 12),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      Spacer(),
                      Icon(Icons.add, color: Colors.white, size: 28),
                      SizedBox(width: 15),
                      Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
                    ],
                  ),
                ),

                // 3. O OUTDOOR (CARD BRANCO FLUTUANTE)
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.42,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                            SizedBox(height: 5),
                            Text("Selecione quais detalhes de Thor serão compartilhados no Match.", 
                              style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      // AVATAR CENTRAL COM INDICADOR "6/8"
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage('https://placedog.net/200/200'), fit: BoxFit.cover),
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text("6 / 8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300, color: Colors.grey[400])),
                      Container(width: 60, height: 2, color: Colors.grey[200]),
                    ],
                  ),
                ),

                Spacer(),

                // 4. AMI (A GRANDE IA CENTRAL)
                Column(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFFF8A00), Color(0xFFF37021)]),
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 25, offset: Offset(0, 10))],
                      ),
                      child: Center(
                        child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("IA ASSISTANT", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFFF6B00), letterSpacing: 1)),
                  ],
                ),

                SizedBox(height: 30),

                // 5. BARRA DE NAVEGAÇÃO FINAL (STYLE 1002880357)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, spreadRadius: 1)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTabItem(Icons.storefront_outlined, "Market"),
                      _buildTabItem(Icons.favorite_border, "Match"),
                      SizedBox(width: 40), // Espaço para a AMI respirar
                      _buildTabItem(Icons.assignment_outlined, "Ads"),
                      _buildTabItem(Icons.person_outline, "Perfil"),
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
}
