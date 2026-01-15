import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Fundo levemente cinza para destacar o branco
      body: Stack(
        children: [
          // 1. HEADER LARANJA COM DESIGN CURVADO (REFERÊNCIA 1002880357)
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: size.height * 0.42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8A00), Color(0xFFFF5C00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // 2. CAMADA DE CONTEÚDO
          SafeArea(
            child: Column(
              children: [
                // TOP BAR (PETUNION + ÍCONES)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: Icon(Icons.pets, color: Color(0xFFFF5C00), size: 18),
                      ),
                      SizedBox(width: 10),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                      Spacer(),
                      Icon(Icons.add, color: Colors.white, size: 28),
                      SizedBox(width: 15),
                      Stack(
                        children: [
                          Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
                          Positioned(right: 0, top: 0, child: CircleAvatar(radius: 7, backgroundColor: Color(0xFFE65100), child: Text("4", style: TextStyle(fontSize: 8, color: Colors.white)))),
                        ],
                      ),
                    ],
                  ),
                ),

                // 3. CARD BRANCO (DESIGN FIDEDIGNO)
                Container(
                  width: size.width * 0.92,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 30, offset: Offset(0, 15))],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          children: [
                            Text("Sociais & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFFF7A00))),
                            SizedBox(height: 10),
                            Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black45, fontSize: 13, height: 1.4)),
                          ],
                        ),
                      ),
                      
                      // AVATAR CENTRALIZADO NA CURVA
                      Container(
                        width: 85, height: 85,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=thor'), fit: BoxFit.cover),
                          boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 15)],
                        ),
                      ),

                      // CONTADOR 6/8 ELEGANTE
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Column(
                          children: [
                            Text("6 / 8", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w200, color: Color(0xFFD1D1D1))),
                            Container(width: 40, height: 2, color: Color(0xFFF0F0F0)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // 4. AMI (FLUTUANDO NO DESIGN)
                Column(
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

                SizedBox(height: 15),

                // 5. BARRA DE NAVEGAÇÃO (ESTILO PILL / REFERENCE 1002880357)
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _navBtn(Icons.storefront_outlined, "Market"),
                      _navBtn(Icons.favorite_border, "Match"),
                      SizedBox(width: 60), // Espaço para a AMI
                      _navBtn(Icons.assignment_outlined, "Ads"),
                      _navBtn(Icons.person_outline, "Perfil"),
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

  Widget _navBtn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[400], size: 26),
        SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// CLIPPER PARA CRIAR A CURVA IDENTICA AO PRINT
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getMaterial(Size size) => getPath(size);

  @override
  Path getPath(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
